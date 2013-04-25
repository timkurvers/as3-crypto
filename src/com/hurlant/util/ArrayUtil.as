/**
 * ArrayUtil
 *
 * A class that allows to compare two ByteArrays.
 * Copyright (c) 2007 Henri Torgemane
 * contributed: Alexander Keck
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.util {
	import flash.utils.ByteArray;


	public class ArrayUtil {

		public static function equals(a1:ByteArray, a2:ByteArray):Boolean {
			if (a1.length != a2.length) return false;
			var l:int = a1.length;
			for (var i:int=0;i<l;i++) {
				if (a1[i]!=a2[i]) return false;
			}
			return true;
		}

		/**
		 * This function xor to ByteArrays and the delivers the result in a new
		 * ByteArray instance with the length __len__.
		 */
		public static function xorByteArray(b1 : ByteArray, b1start : int, b2 : ByteArray, b2start : int, len : int) : ByteArray {

			var res : ByteArray = new ByteArray();

			for (var loop : int = 0; loop < len; loop++) {
				res[loop] = b1[b1start + loop] ^ b2[b2start + loop];
			}

			return res;
		}

		/**
		 * This function will encode the integer part (32bit) of the number. The type
		 * Number was choosen to make it possible to use unsigned integers.
		 *
		 * TODO: check the correctness of signed integer
		 */
		public static function encodeIntLittleEndian(n : Number) : ByteArray {
			var res : ByteArray = new ByteArray();

			res[0] = (n & 0xff);
			res[1] = ((n >>> 8) & 0xff);
			res[2] = ((n >>> 16) & 0xff);
			res[3] = ((n >>> 24) & 0xff);

			return res;
		}

		/**
		 * This function will encode the integer part (32bit) of the number. The type
		 * Number was choosen to make it possible to use unsigned integers.
		 *
		 * TODO: check the correctness of signed integer
		 */
		public static function encodeIntBigEndian(n : Number) : ByteArray {
			var res : ByteArray = new ByteArray();

			res[0] = ((n >>> 24) & 0xff);
			res[1] = ((n >>> 16) & 0xff);
			res[2] = ((n >>> 8) & 0xff);
			res[3] = (n & 0xff);

			return res;
		}

	}

}