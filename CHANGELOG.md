# Changelog

### v1.4.3 - December 3, 2014
- SHA2 certificate support

### v1.4.2 - January 10, 2014
- Patch for Issue54: Submitted Patch for various certificate parsing issues

### v1.4 - October 2, 2011
- Implemented [Jason von Nieda's BigInteger bug-fixes](http://groups.google.com/group/as3crypto/browse_thread/thread/92688a271a397bd0) and unit-tests.
- Added [Joey Parrish' bug-fixes](http://groups.google.com/group/as3crypto/browse_thread/thread/ce57305fbeaaf08f) for `TLSEngine.sendApplicationData`
- Pointed root certificate extractor tool to correct Mozilla domain (mxr.mozilla.org)
- Updated to latest certificates as of 27th of September.
- `HexUtil` will now strip any leading 0x, fixes a NULL-byte prepending bug.
- Fixed BigInteger test-case where high-bits were resulting in unexpected negative numbers.
- Added [apostol...@gmail.com's fix](http://code.google.com/p/as3crypto/issues/detail?id=59) for `RSAKey` padding failures.
- Implemented [andrewwe...@gmail.com's flags-fix](http://code.google.com/p/as3crypto/issues/detail?id=52) for `RSAKey.generate`
- Converted all source-files and LICENSE to UNIX line endings.
- Unit-tests now live in their own source folder to greatly decrease library size (~30%)
- Added README.

### v1.3a - September 25, 2011
- Fixed static initializer for `AESKey`
- Removed all warnings related to missing semi-colons and unused imports
- Removed tool/IDE-specific files.
- Removed demo files.
- Added LICENSE & CHANGELOG.
- Added test-harness which logs to Flash output.

### v1.3 - June 21, 2008
- TLS: partial TLS 1.0 support (RSA only), with TLSSocket and STARTTLS support.
- Cert: Basic X509 (v1 and v2) Certificate parsing and validation.
- Cert: Builtin Root CAs, ripped from Mozilla. (see `MozillaRootCertificates`)
- DER: bug fix in parsing of UTCTime.
- DER: limited support for outputing ASN-1 structures as DER (as little as needed for X509 cert. signing to work)
- RSA: support for RSA signing/verifying (needed for TLS cert validation)
- Hash: MD5 and MD2 classes no longer alter their source data.
- Secret key: RC4 doesn't reset its state before every encrypt/decrypt operation anymore. If you need that behavior, you need to use `.init(key)` before each call.

### v1.2 - June 21, 2008
- Math: Completed BigInteger support. Moved BigInteger under `com.hurlant.math`
- Public key: RSA decrypt and key generation.
- Crud: basic DER/PEM support to parse RSA keys (X.509 SubjectPublicKeyInfo and PKCS#1 RSAPrivateKey)
- Random: support for TLS-PRF; weak attempt at seeding Random.
- Hash: added MD2. slow legacy stuff.
- Modes: CFB, CFB8 and OFB padding bug fixes.
- Secret key: TripeDES bug fix.

### v1.1 - June 21, 2008
- Secret key: DES, 3DES, BlowFish.
- Modes: CTR, SimpleIV.
- Added `toString()` to each algorithm.
- Added `dispose()` to each algorithm. `dispose()` attempts to clear keys and states from the memory, but it is not guaranteed to work.

### v1.0 - Initial release
- Public key: RSA encrypt.
- Secret key: AES, XTEA, RC4.
- Hash: MD5, SHA-1, SHA-224, SHA-256.
- HMAC.
- Modes: ECB, CBC, CFB, CFB8, OFB.
- Converters: Base64, Hex.
