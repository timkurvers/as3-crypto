#!/usr/bin/perl -w

use strict;

use MIME::Base64;

# dependencies:
# - openssl and curl are installed and callable on your setup
# - you have internet access, and lxr.mozilla.org is up.
#

sub der2pem($) {
  my $src = shift;
  my $bin = "";
  while ($src =~ /\\([0-8]+)/sg) {
    $bin .= chr(oct($1));
  }
  open (TMP, ">tmp.der");
  print TMP $bin;
  close TMP;
  my $c = `openssl x509 -in tmp.der -inform DER -C`;
  $c =~ /(-----BEGIN CERTIFICATE-----.*-----END CERTIFICATE-----)/s;
  my $pem = $1;
  $c =~ /_subject_name\[[0-9]+\]={([^}]+)}/s;
  my $subject = $1;
  $bin = "";
  while ($subject =~ /0x([0-9a-f]+)/sgi) {
    $bin .= chr(hex($1));
  }
  my $b64 = encode_base64($bin);
  chomp($b64);
  unlink ("tmp.der");
  return ($pem, $b64);
}

sub fetchCertData() {
  system("curl http://lxr.mozilla.org/seamonkey/source/security/nss/lib/ckfw/builtins/certdata.c?raw=1 > certdata.c");
}

# read Mozilla's generated certdata.c source file
sub getCertData() {
  open(F, "<certdata.c");
  my $data = join('',<F>);
  close (F);
  return $data;
}

sub extractCerts($) {
  my $data = shift;
  my @a = ();
  my $i = 0;
  # horrible regexp that appears to extract certs from source
  while ($data =~ /static const NSSItem ([^;]*?) \[\] = {[^;]*?{[^;]*?},[^;]*?{[^;]*?},[^;]*?{[^;]*?},[^;]*?{[^;]*?},[^;]*?{[^;]*?"([^";]*?)"[^;]*?void \*.([^,]*?), \(PRUint32\)([0-9]{3,7}) }.};/sg) {
    my ($pem, $subject) = der2pem($3);
    chomp($pem);
    $i++;
    print "\rExtracting certificates: $i";
    push @a, { name => $2,  cert => $pem, subject => $subject };
  }
  print "\n";
  return @a;
}

sub generateAs3Class(@) {
  my @certs = @_;
  my $class = <<"DONE";
/* THIS IS A GENERATED FILE */
/**
 * MozillaRootCertificates
 *
 * A list of built-in Certificate Authorities,
 * pilfered from Mozilla. 
 *
 * See certs/tool/grabRootCAs.pl for details.
 * 
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.cert {
	public class MozillaRootCertificates extends X509CertificateCollection {
		public function MozillaRootCertificates() {
DONE
  foreach (@certs) {
    my %c = %$_;
    my $indent = "\t\t\t\t";
    my $name = toString($c{"name"},'');
    my $subject = toString($c{"subject"},$indent);
    my $cert = toString($c{"cert"},$indent, 1);
    $class .= "\t\t\tsuper.addPEMCertificate($name,\n$indent// X500 Subject, for lookups.\n$indent$subject,\n$indent$cert);\n";
  }
  $class .= <<"DONE";
		}
		override public function addPEMCertificate(name:String,subject:String,pem:String):void {
			throw new Error("Cannot add certificates to the Root CA store.");
		}
		override public function addCertificate(cert:X509Certificate):void {
			throw new Error("Cannot add certificates to the Root CA store.");
		}
	}
}
DONE
  return $class;
}

sub toString($$$) {
  my ($src, $indent, $keepnl) = @_;
  my $nl = '';
  $nl = "\\n" if $keepnl;
  $src =~ s/\\/\\\\/g;
  $src =~ s/(['"])/\\$1/g;
  $src =~ s/[\n\r]+/$nl"+\n$indent"/g;
  return '"'.$src.'"';
}

sub main() {
  fetchCertData();
  my $data = getCertData();
  my @certs = extractCerts($data);
  my $class = generateAs3Class(@certs);
  open (TMP, ">../../com/hurlant/crypto/cert/MozillaRootCertificates.as");
  print TMP $class;
  close TMP;
  unlink "certdata.c";
  print "Root CAs written to com/hurlant/crypto/cert/MozillaRootCertificates.as\n";
}

main();
