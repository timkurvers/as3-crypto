/**
 * CFBModeTest
 *
 * A test class for CFBMode
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.symmetric {

	import com.hurlant.tests.*;

	import com.hurlant.crypto.symmetric.AESKey;
	import com.hurlant.crypto.symmetric.CFBMode;
	import com.hurlant.crypto.symmetric.NullPad;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	public class CFBModeTest {

		/**
		 * http://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf
		 */
		[Test]
		public function aes128():void {
			var key:ByteArray = Hex.toArray("2b7e151628aed2a6abf7158809cf4f3c");
			var pt:ByteArray = Hex.toArray(
				"6bc1bee22e409f96e93d7e117393172a" +
				"ae2d8a571e03ac9c9eb76fac45af8e51" +
				"30c81c46a35ce411e5fbc1191a0a52ef" +
				"f69f2445df4f9b17ad2b417be66c3710");
			var ct:ByteArray = Hex.toArray(
				"3b3fd92eb72dad20333449f8e83cfb4a" +
				"c8a64537a0b3a93fcde3cdad9f1ce58b" +
				"26751f67a3cbb140b1808cf187a4f4df" +
				"c04b05357c5d1c0eeac4c66f9ff7f2e6");
			var cfb:CFBMode = new CFBMode(new AESKey(key), new NullPad);
			cfb.IV = Hex.toArray("000102030405060708090a0b0c0d0e0f");
			var src:ByteArray = new ByteArray;
			src.writeBytes(pt);
			cfb.encrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(ct));
			cfb.decrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(pt));
		}

		[Test]
		public function aes192():void {
			var key:ByteArray = Hex.toArray("8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b");
			var pt:ByteArray = Hex.toArray(
				"6bc1bee22e409f96e93d7e117393172a" +
				"ae2d8a571e03ac9c9eb76fac45af8e51" +
				"30c81c46a35ce411e5fbc1191a0a52ef" +
				"f69f2445df4f9b17ad2b417be66c3710");
			var ct:ByteArray = Hex.toArray(
				"cdc80d6fddf18cab34c25909c99a4174" +
				"67ce7f7f81173621961a2b70171d3d7a" +
				"2e1e8a1dd59b88b1c8e60fed1efac4c9" +
				"c05f9f9ca9834fa042ae8fba584b09ff");
			var cfb:CFBMode = new CFBMode(new AESKey(key), new NullPad);
			cfb.IV = Hex.toArray("000102030405060708090a0b0c0d0e0f");
			var src:ByteArray = new ByteArray;
			src.writeBytes(pt);
			cfb.encrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(ct));
			cfb.decrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(pt));
		}

		[Test]
		public function aes256():void {
			var key:ByteArray = Hex.toArray(
				"603deb1015ca71be2b73aef0857d7781" +
				"1f352c073b6108d72d9810a30914dff4");
			var pt:ByteArray = Hex.toArray(
				"6bc1bee22e409f96e93d7e117393172a" +
				"ae2d8a571e03ac9c9eb76fac45af8e51" +
				"30c81c46a35ce411e5fbc1191a0a52ef" +
				"f69f2445df4f9b17ad2b417be66c3710");
			var ct:ByteArray = Hex.toArray(
				"dc7e84bfda79164b7ecd8486985d3860" +
				"39ffed143b28b1c832113c6331e5407b" +
				"df10132415e54b92a13ed0a8267ae2f9" +
				"75a385741ab9cef82031623d55b1e471");
			var cfb:CFBMode = new CFBMode(new AESKey(key), new NullPad);
			cfb.IV = Hex.toArray("000102030405060708090a0b0c0d0e0f");
			var src:ByteArray = new ByteArray;
			src.writeBytes(pt);
			cfb.encrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(ct));
			cfb.decrypt(src);
			assert(Hex.fromArray(src), Hex.fromArray(pt));
		}

	}

}
