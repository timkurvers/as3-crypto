/**
 * RSAKeyTest
 *
 * A test class for RSAKey
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.rsa {

	import com.hurlant.tests.*;

	import com.hurlant.crypto.rsa.RSAKey;
	import com.hurlant.util.Hex;
	import com.hurlant.util.der.PEM;

	import flash.utils.ByteArray;

	public class RSAKeyTest {

		[Test]
		public function smoke():void {
			var N:String ="C4E3F7212602E1E396C0B6623CF11D26204ACE3E7D26685E037AD2507DCE82FC" +
					"28F2D5F8A67FC3AFAB89A6D818D1F4C28CFA548418BD9F8E7426789A67E73E41";
			var E:String = "10001";
			var D:String = "7cd1745aec69096129b1f42da52ac9eae0afebbe0bc2ec89253598dcf454960e" +
					"3e5e4ec9f8c87202b986601dd167253ee3fb3fa047e14f1dfd5ccd37e931b29d";
			var P:String = "f0e4dd1eac5622bd3932860fc749bbc48662edabdf3d2826059acc0251ac0d3b";
			var Q:String = "d13cb38fbcd06ee9bca330b4000b3dae5dae12b27e5173e4d888c325cda61ab3";
			var DMP1:String = "b3d5571197fc31b0eb6b4153b425e24c033b054d22b9c8282254fe69d8c8c593";
			var DMQ1:String = "968ffe89e50d7b72585a79b65cfdb9c1da0963cceb56c3759e57334de5a0ac3f";
			var IQMP:String = "d9bc4f420e93adad9f007d0e5744c2fe051c9ed9d3c9b65f439a18e13d6e3908";
			// create a key.
			var rsa:RSAKey = RSAKey.parsePrivateKey(N,E,D, P,Q,DMP1,DMQ1,IQMP);
			var txt:String = "hello";
			var src:ByteArray = Hex.toArray(Hex.fromString(txt));
			var dst:ByteArray = new ByteArray;
			var dst2:ByteArray = new ByteArray;
			rsa.encrypt(src, dst, src.length);
			rsa.decrypt(dst, dst2, dst.length);
			var txt2:String = Hex.toString(Hex.fromArray(dst2));
			assert(txt, txt2);
		}

		[Test]
		public function generate():void {
			var rsa:RSAKey = RSAKey.generate(256, "10001");
			// same lame smoke test here.
			var txt:String = "hello";
			var src:ByteArray = Hex.toArray(Hex.fromString(txt));
			var dst:ByteArray = new ByteArray;
			var dst2:ByteArray = new ByteArray;
			rsa.encrypt(src, dst, src.length);
			rsa.decrypt(dst, dst2, dst.length);
			var txt2:String = Hex.toString(Hex.fromArray(dst2));
			assert(txt, txt2);
		}

		[Test]
		public function pem():void {
			var pem:String = "-----BEGIN RSA PRIVATE KEY-----\n" +
					"MGQCAQACEQDJG3bkuB9Ie7jOldQTVdzPAgMBAAECEQCOGqcPhP8t8mX8cb4cQEaR\n" +
					"AgkA5WTYuAGmH0cCCQDgbrto0i7qOQIINYr5btGrtccCCQCYy4qX4JDEMQIJAJll\n" +
					"OnLVtCWk\n" +
					"-----END RSA PRIVATE KEY-----";
			var rsa:RSAKey = PEM.readRSAPrivateKey(pem);
			//trace(rsa.dump());

			// obligatory use
			var txt:String = "hello";
			var src:ByteArray = Hex.toArray(Hex.fromString(txt));
			var dst:ByteArray = new ByteArray;
			var dst2:ByteArray = new ByteArray;
			rsa.encrypt(src, dst, src.length);
			rsa.decrypt(dst, dst2, dst.length);
			var txt2:String = Hex.toString(Hex.fromArray(dst2));
			assert(txt, txt2);
		}

		[Test]
		public function pem2():void {
			var pem:String = "-----BEGIN PUBLIC KEY-----\n" +
					"MCwwDQYJKoZIhvcNAQEBBQADGwAwGAIRAMkbduS4H0h7uM6V1BNV3M8CAwEAAQ==\n" +
					"-----END PUBLIC KEY-----";
			var rsa:RSAKey = PEM.readRSAPublicKey(pem);
			assert(rsa != null);
			//trace(rsa.dump());
		}

		[Test]
		public function adobeSample():void {
	       var myPEMPublicKeyString:String =
	       		"-----BEGIN PUBLIC KEY-----" +
	       		"MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALHpyYTN96rMbkQB" +
	       		"gIoB9vH2AN47NN1YXoKxAaqpEkafQdPUw41p4gTrA0r04acE" +
	       		"m3GaWUA4YROCSKgJnvii0UsCAwEAAQ==" +
	       		"-----END PUBLIC KEY-----";

	        // Put data to be encrypted into a byte array
	        var data:ByteArray = Hex.toArray(Hex.fromString("MyInputString"));

	        // Destination ByteArray that will contain the encrypted data
	        var encryptedResult:ByteArray = new ByteArray;

	        // Set up the RSAKey and encrypt the data
	        var rsa:RSAKey = PEM.readRSAPublicKey(myPEMPublicKeyString);
	        rsa.encrypt(data, encryptedResult, data.length);

	        // Convert the encrypted data into a hex encoded string for transport
	        // The other side of the connection can convert the hex back into
	        // binary before decrypting
	        var hexEncryptedResult:String = Hex.fromArray(encryptedResult);
	        assert(hexEncryptedResult.length > 5);
		}

		[Test]
		public function longText():void {
			var pem:String = "-----BEGIN RSA PRIVATE KEY-----\n" +
					"MGQCAQACEQDJG3bkuB9Ie7jOldQTVdzPAgMBAAECEQCOGqcPhP8t8mX8cb4cQEaR\n" +
					"AgkA5WTYuAGmH0cCCQDgbrto0i7qOQIINYr5btGrtccCCQCYy4qX4JDEMQIJAJll\n" +
					"OnLVtCWk\n" +
					"-----END RSA PRIVATE KEY-----";
			var rsa:RSAKey = PEM.readRSAPrivateKey(pem);

			var txt:String = "With each new release" +
					"of Flash Player, Adobe strives to introduce a stronger platform with" +
					"more robust security controls and tools for creating secure" +
					"applications. By leveraging those tools, compiling for recent" +
					"versions, performing data validation, and leveraging available SDKs," +
					"developers can produce more secure applications that run in Flash" +
					"Player.";
			var src:ByteArray = Hex.toArray(Hex.fromString(txt));
			var dst:ByteArray = new ByteArray;
			var dst2:ByteArray = new ByteArray;
			rsa.encrypt(src, dst, src.length);
			rsa.decrypt(dst, dst2, dst.length);
			var txt2:String = Hex.toString(Hex.fromArray(dst2));
			assert(txt, txt2);
		}

	}

}
