# ActionScript 3 Cryptography Library

[![Seeking new maintainer(s)](https://img.shields.io/badge/%E2%9A%A0-seeking_new_maintainer%28s%29-red.svg?style=flat)](https://github.com/timkurvers/as3-crypto/issues/21)

Copyright (c) 2007 Henri Torgemane  
Modifications (c) 2011-2013 Tim Kurvers and various other contributors

A cryptography library written in ActionScript 3 that provides several common algorithms. This version also introduces a TLS engine, more commonly known as SSL.

Licensed under the **BSD** license. Includes several derivative works from Java, C and JavaScript sources. See LICENSE for more information and a list of contributors.


## Original & GitHub-fork

The original project can be found at [http://code.google.com/p/as3crypto/](http://code.google.com/p/as3crypto/)

Although unofficial, this GitHub-fork includes community fixes and patches.

Consult the CHANGELOG for implemented fixes and contributors.


## Usage

The binary can be found in `/deploy/as3crypto.swc`

Copy to your library folder, add it to your class-path and off you go.


## Features

* Protocols: TLS 1.0 support (partial)
* Certificates: X.509 Certificate parsing and validation, built-in Root CAs.
* Public Key Encryption: RSA (encrypt/decrypt, sign/verify)
* Secret Key Encryption: AES, DES, 3DES, BlowFish, XTEA, RC4
* Confidentiality Modes: ECB, CBC, CFB, CFB8, OFB, CTR
* Hashing Algorithms: MD2, MD5, SHA-1, SHA-224, SHA-256
* Paddings available: PKCS#5, PKCS#1 type 1 and 2
* Other Useful Stuff: HMAC, Random, TLS-PRF, some ASN-1/DER parsing
