/**
 * PKCS5
 *
 * A padding implementation of PKCS5.
 * Copyright (c) 2007 Henri Torgemane
 * contributed: Alexander Keck
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.symmetric {
	import com.hurlant.crypto.hash.HMAC;
	import com.hurlant.crypto.hash.SHA1;
	import com.hurlant.util.ArrayUtil;

	import flash.utils.ByteArray;

	/**
	 * TODO: rename / refactor class name and methods since the used general definition
	 * of the padding algorithm is defined in PKCS#7 (rfc5652 section 6.3)
	 */
	public class PKCS5 implements IPad
	{
		private var blockSize:uint;

		public function PKCS5(blockSize:uint=0) {
			this.blockSize = blockSize;
		}

		public function pad(a:ByteArray):void {
			var c:uint = blockSize-a.length%blockSize;
			for (var i:uint=0;i<c;i++){
				a[a.length] = c;
			}
		}
		public function unpad(a:ByteArray):void {
			var c:uint = a.length%blockSize;
			if (c!=0) throw new Error("PKCS#5::unpad: ByteArray.length isn't a multiple of the blockSize");
			c = a[a.length-1];
			for (var i:uint=c;i>0;i--) {
				var v:uint = a[a.length-1];
				a.length--;
				if (c!=v) throw new Error("PKCS#5:unpad: Invalid padding value. expected ["+c+"], found ["+v+"]");
			}
			// that is all.
		}

		public function setBlockSize(bs:uint):void {
			blockSize = bs;
		}

		/**
		 * Implementation of the PDKDF2 (public based key derivation
		 * function 2) from PKCS#5 (rfc2898) chapter 5.2.
		 * In this implementation the HMAC-SHA1 will be used as the
		 * PRF (pseudorandom function) with a hLen of 20 Bytes.
		 *
		 * @param p password
		 * @param s salt
		 * @param c iteration count
		 */
		public static function pbkdf2(p : ByteArray, s : ByteArray, c : int, dkLen : Number) : ByteArray {

			// TODO make the prf interchangeable
			var prf : HMAC = new HMAC(new SHA1());
//			var prf : HMAC = new HMAC(new SHA256());
			var hLen : int = 20;
			var l : int = Math.ceil(dkLen / hLen);

			// derived key
			var dk : ByteArray = new ByteArray();

			for (var i : int = 1; i <= l; i++) {

				var u : ByteArray = new ByteArray();
				u.writeBytes(s);
				u.writeBytes(ArrayUtil.encodeIntBigEndian(i));

				var f : ByteArray = new ByteArray();
				//prefill f with zeros so xor will work in the inner loop
				for (var temp : int = 0; temp < 20; temp++) {
					f[temp] = 0;
				}

				for (var cLoop : int = 1; cLoop <= c; cLoop++) {
					u = prf.compute(p, u);
					f = ArrayUtil.xorByteArray(f, 0, u, 0, hLen);
				}

				// copy bytes
				var tempLen : int = dkLen - dk.length;
				if (tempLen > f.length) {
					tempLen = f.length;
				}
				dk.writeBytes(f, 0, tempLen);
			}

			return dk;
		}

	}
}