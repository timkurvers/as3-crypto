package com.hurlant.util.der
{
	import com.hurlant.util.asn1.parser.*;
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.OIDType;

	public class Type2
	{
		//  specifications of Upper Bounds
		//  shall be regarded as mandatory
		//  from Annex B of ITU-T X.411
		//  Reference Definition of MTS Parameter Upper Bounds
		
		//      Upper Bounds
		public static const ub_name			:int =     32768;
		public static const ub_common_name :int =     64;
		public static const ub_locality_name       :int =     128;
		public static const ub_state_name  :int =     128;
		public static const ub_organization_name   :int =     64;
		public static const ub_organizational_unit_name    :int =     64;
		public static const ub_title       :int =     64;
		public static const ub_match       :int =     128;
		
		public static const ub_emailaddress_length:int = 128;
		
		public static const ub_common_name_length:int = 64;
		public static const ub_country_name_alpha_length:int = 2;
		public static const ub_country_name_numeric_length:int = 3;
		public static const ub_domain_defined_attributes:int = 4;
		public static const ub_domain_defined_attribute_type_length:int = 8;
		public static const ub_domain_defined_attribute_value_length:int = 128;
		public static const ub_domain_name_length:int = 16;
		public static const ub_extension_attributes:int = 256;
		public static const ub_e163_4_number_length:int = 15;
		public static const ub_e163_4_sub_address_length:int = 40;
		public static const ub_generation_qualifier_length:int = 3;
		public static const ub_given_name_length:int = 16;
		public static const ub_initials_length:int = 5;
		public static const ub_integer_options:int = 256;
		public static const ub_numeric_user_id_length:int = 32;
		public static const ub_organization_name_length:int = 64;
		public static const ub_organizational_unit_name_length:int = 32;
		public static const ub_organizational_units:int = 4;
		public static const ub_pds_name_length:int = 16;
		public static const ub_pds_parameter_length:int = 30;
		public static const ub_pds_physical_address_lines:int = 6;
		public static const ub_postal_code_length:int = 16;
		public static const ub_surname_length:int = 40;
		public static const ub_terminal_id_length:int = 24;
		public static const ub_unformatted_address_length:int = 180;
		public static const ub_x121_address_length:int = 16;
		public static const ub_pkcs9_string:int = 255; // see ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-9-v2/pkcs-9.pdf, ASN.1 module, pkcs-9-ub-pkcs9String
		
		// Note - upper bounds on TeletexString are measured in characters.
		// A significantly greater number of octets will be required to hold
		// such a value.  As a minimum, 16 octets, or twice the specified upper
		// bound, whichever is the larger, should be allowed.
		// XXX ASN-1 was clearly invented to scare children.
		
		// yay for implicit upper bounds being explicitely specified.
		public static const MAX:int = int.MAX_VALUE;

		// PKIX specific OIDs
		public static const iso:String = "1";
		public static const identified_organization:String = "3";
		public static const dod:String = "6";
		public static const internet:String = "1";
		public static const security:String = "5";
		public static const mechanisms:String = "5";
		public static const pkix:String = "7";
		public static const id_pkix:OIDType = oid( iso, identified_organization, dod, internet, security, mechanisms, pkix );
		
		// PKIX arcs
		// arc for private certificate extensions
		public static const id_pe:OIDType = oid( id_pkix, 1 );
		// arc for policy qualifier types
		public static const id_qt:OIDType = oid( id_pkix, 2 );
		// arc for extended key purpose OIDS
		public static const id_kp:OIDType = oid( id_pkix, 3 );
		// arc for access descriptors
		public static const id_ad:OIDType = oid( id_pkix, 48 );
		
		// policyQualifierIds for Internet policy qualifiers
		//		OID for CPS qualifier
		public static const id_qt_cps:OIDType = oid( id_qt, 1 );
		//		OID for user notice qualifier
		public static const id_qt_unotice:OIDType = oid( id_qt, 2 );
		
		public static const pkcs_9:OIDType = oid( iso, member_body, us, rsadsi, pkcs, 9);
		public static const emailAddress:OIDType = oid(pkcs_9, 1);
		// oh look, an Unstructured Name ... Joy..YAY for VMWare. BP
		public static const pkcs9_unstructuredName:OIDType = oid(pkcs_9, 2); 
		
		// object identifiers for Name type and directory attribute support

		// Object identifier assignments
		public static const joint_iso_ccitt:String = "2";
		public static const ds:String = "5";
		public static const id_at:OIDType = oid(joint_iso_ccitt, ds, 4);
		// Attributes
		public static const id_at_commonName:OIDType = oid( id_at, 3 );
		public static const id_at_surname:OIDType = oid( id_at, 4 );
		public static const id_at_countryName:OIDType = oid( id_at, 6 );		
		public static const id_at_localityName:OIDType = oid( id_at, 7 );
		public static const id_at_stateOrProvinceName:OIDType = oid( id_at, 8 );
		public static const id_at_organizationName:OIDType = oid( id_at, 10 );
		public static const id_at_organizationalUnitName:OIDType = oid(id_at, 11);
		public static const id_at_title:OIDType = oid( id_at, 12 );
		public static const id_at_name:OIDType = oid( id_at, 41 );
		public static const id_at_givenName:OIDType = oid( id_at, 42 );
		public static const id_at_initials:OIDType = oid( id_at, 43 );
		public static const id_at_generationQualifier:OIDType = oid( id_at, 44 );
		public static const id_at_dnQualifier:OIDType = oid( id_at, 46 );

		// algorithm identifiers and parameter structures
		public static const member_body:String = "2";
		public static const us:String = "840";
		public static const rsadsi:String = "113549";
		public static const pkcs:String = "1";
		public static const x9_57:String = "10040";
		public static const x9algorithm:String = "4";
		public static const ansi_x942:String = "10046";
		public static const number_type:String = "2";
		public static const pkcs_1:OIDType = oid( iso, member_body, us, rsadsi, pkcs, 1 );
		
		public static const rsaEncryption:OIDType = oid(pkcs_1, 1);
		public static const md2WithRSAEncryption:OIDType = oid(pkcs_1, 2);
		public static const md5WithRSAEncryption:OIDType = oid(pkcs_1, 4);
		public static const sha1WithRSAEncryption:OIDType = oid(pkcs_1, 5);
		public static const id_dsa_with_sha1:OIDType = oid( iso, member_body, us, x9_57, x9algorithm, 3);
		public static const Dss_Sig_Value:ASN1Type = sequence(
			{ r: integer() },
			{ s: integer() }
		);
		public static const dhpublicnumber:OIDType = oid( iso, member_body, us, ansi_x942, number_type, 1);
		public static const ValidationParms:ASN1Type = sequence(
			{ seed: bitString() },
			{ pgenCounter: integer() }
		);
		public static const DomainParameters:ASN1Type = sequence(
			{ p: integer() }, // odd prime, p=jq +1
			{ g: integer() }, // generator, g
			{ q: integer() }, // factor of p-1
			{ j: optional(integer()) }, // subgroup factor, j>= 2
			{ validationParms: optional(ValidationParms) }
		);
		public static const id_dsa:OIDType = oid(iso, member_body, us, x9_57, x9algorithm, 1);
		public static const Dss_Parms:ASN1Type = sequence(
			{ p: integer() },
			{ q: integer() },
			{ g: integer() }
		);
		// attribute data type
		public static const Attribute:Function = function(Type:ASN1Type, id:OIDType):ASN1Type {
			return sequence (
				{ type: id },
				{ values: setOf(Type, 1, MAX) }
			);
		};


		public static const Version:ASN1Type = integer(
//			value(0,"v1"), value(1,"v2"),value(2,"v3")
		);

		public static const Extension:ASN1Type = sequence(
			{ extnId: oid() },
			{ critical: defaultValue(false, boolean()) },
			{ extnValue: octetString() } // not quite enough. see line 5155
		);
		public static const Extensions:ASN1Type = sequenceOf(Extension, 1, MAX);
		public static const UniqueIdentifier:ASN1Type = bitString();
		public static const CertificateSerialNumber:ASN1Type = integer();

		// Directory string type, used extensively in Name types
		public static const directoryString:Function = function(maxSize:int):ASN1Type {
			return choice(
				{ teletexString: teletexString(1,maxSize) },
				{ printableString: printableString(1,maxSize) },
				{ universalString: universalString(1,maxSize) },
				{ bmpString: bmpString(1,maxSize) },
				{ utf8String: utf8String(1,maxSize) }
			);
		};
		
		// PKCS9 string value, handled for VMWare cases (and anyone with pkcs unstructured strings
		public static const pkcs9string:Function = function( maxSize:int):ASN1Type {
			return choice( 
				{ utf8String : utf8String(1, maxSize) },
				{ directoryString : directoryString(maxSize) }
			);
		};
		
		public static const AttributeTypeAndValue:ASN1Type = choice(
			{ name: sequence(
				{ type: id_at_name },
				{ value: directoryString(ub_name) }
			)},
			{ commonName: sequence(
				{ type: id_at_commonName },
				{ value: directoryString(ub_common_name) }
			)},
			{ surname: sequence(
				{ type: id_at_surname },
				{ value: directoryString(ub_name) }
			)},
			{ givenName: sequence(
				{ type: id_at_givenName },
				{ value: directoryString(ub_name) }
			)},
			{ initials: sequence(
				{ type: id_at_initials },
				{ value: directoryString(ub_name) }
			)},
			{ generationQualifier: sequence(
				{ type: id_at_generationQualifier },
				{ value: directoryString(ub_name) }
			)},
			{ dnQualifier: sequence(
				{ type: id_at_dnQualifier },
				{ value: printableString() }
			)},
			{ countryName: sequence(
				{ type: id_at_countryName },
				{ value: printableString(2) } // IS 3166 codes only
			)},
			{ localityName: sequence(
				{ type: id_at_localityName },
				{ value: directoryString(ub_locality_name) }
			)},
			{ stateOrProvinceName: sequence(
				{ type: id_at_stateOrProvinceName },
				{ value: directoryString(ub_state_name) }
			)},
			{ organizationName: sequence(
				{ type: id_at_organizationName },
				{ value: directoryString(ub_organization_name) }
			)},
			{ organizationalUnitName: sequence(
				{ type: id_at_organizationalUnitName },
				{ value: directoryString(ub_organizational_unit_name) }
			)},
			{ title: sequence(
				{ type: id_at_title },
				{ value: directoryString(ub_title) }
			)},
			// Legacy attributes
			{ pkcs9email: sequence(
				{ type: emailAddress },
				{ value: ia5String(ub_emailaddress_length) }
			)},
			{ pkcs9UnstructuredName: sequence(
				{ type : pkcs9_unstructuredName },
				{ value: pkcs9string(ub_pkcs9_string) }
			)}
			
		);
		public static const RelativeDistinguishedName:ASN1Type = setOf(AttributeTypeAndValue, 1, MAX);
		public static const RDNSequence:ASN1Type = sequenceOf( RelativeDistinguishedName );
		public static const Name:ASN1Type = choice( { sequence: RDNSequence } );

		public static const Time:ASN1Type = choice(
			{ utcTime: utcTime() },
			{ generalTime: generalizedTime() }
		);
		public static const Validity:ASN1Type = sequence(
			{ notBefore: Time },
			{ notAfter: Time }
		);
		// Definition of AlgorithmIdentifier
		public static const AlgorithmIdentifier:ASN1Type = sequence(
			{ algorithm: oid() },
			// { parameters: optional(any()) } // XXX any not implemented (line 5281)
			{ parameters: optional(choice(
				{ none: nulll() },
				{ dss_parms: Dss_Parms },
				{ domainParameters: DomainParameters }
			  ))
			}
			
		);
		public static const SubjectPublicKeyInfo:ASN1Type = sequence(
			{ algorithm: AlgorithmIdentifier },
			{ subjectPublicKey: bitString() }
		);
		
		// Parameterized Type SIGNED
		public static const signed:Function = function(o:ASN1Type):ASN1Type {
			return sequence(
				{ toBeSigned: extract(o) },
				{ algorithm: AlgorithmIdentifier },
				{ signature: bitString() }
			);
		};
		
		// Public Key Certificate
		public static const Certificate:ASN1Type = signed(sequence(
			{ version: explicitTag(0, ASN1Type.CONTEXT, defaultValue(0, Version)) },
			{ serialNumber: CertificateSerialNumber },
			{ signature: AlgorithmIdentifier },
			{ issuer: extract(Name) },
			{ validity: Validity },
			{ subject: extract(Name) },
			{ subjectPublicKeyInfo: SubjectPublicKeyInfo },
			{ issuerUniqueIdentifier: implicitTag(1, ASN1Type.CONTEXT, optional( UniqueIdentifier )) },
			{ subjectUniqueIdentifier: implicitTag(2, ASN1Type.CONTEXT, optional( UniqueIdentifier )) },
			{ extensions: explicitTag(3, ASN1Type.CONTEXT, optional( Extensions )) }
		));


		// skipping a nightmare of "GeneralName" intricacies.
		// XXX implement later if we happen to actually need this.
		
	}
}
