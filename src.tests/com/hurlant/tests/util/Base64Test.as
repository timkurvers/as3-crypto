/**
 * Base64Test
 *
 * Tests for Base64 utility
 *
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests.util {

	import com.hurlant.tests.*;
	import com.hurlant.util.ArrayUtil;
	import com.hurlant.util.Base64;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	public class Base64Test {

		/**
		 * Test vectors from RFC 4648 (http://tools.ietf.org/html/rfc4648) and Wikipedia (http://en.wikipedia.org/wiki/Base64)
		 */
		[Test]
		public function vectors():void {
			var srcs:Array = [
				'',
				'f',
				'fo',
				'foo',
				'foob',
				'fooba',
				'foobar',

				'pleasure.',
				'leasure.',
				'easure.',
				'asure.',
				'sure.',

				'Man is distinguished, not only by his reason, ' +
				'but by this singular passion from other animals, ' +
				'which is a lust of the mind, that by a perseverance ' +
				'of delight in the continued and indefatigable generation ' +
				'of knowledge, exceeds the short vehemence of any carnal pleasure.',

				'¢€𝇇'
			];

			var encs:Array = [
				'',
				'Zg==',
				'Zm8=',
				'Zm9v',
				'Zm9vYg==',
				'Zm9vYmE=',
				'Zm9vYmFy',

				'cGxlYXN1cmUu',
				'bGVhc3VyZS4=',
				'ZWFzdXJlLg==',
				'YXN1cmUu',
				'c3VyZS4=',

				'TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlz' +
				'IHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2Yg' +
				'dGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGlu' +
				'dWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRo' +
				'ZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=',

				'wqLigqzwnYeH'
			];

			for (var i:uint=0; i<srcs.length; i++) {
				assert(Base64.encode(srcs[i]), encs[i]);
				assert(Base64.decode(encs[i]), srcs[i]);

				var src:ByteArray = Hex.toArray(Hex.fromString(srcs[i]));
				assert(Base64.encodeByteArray(src), encs[i]);
				assert(ArrayUtil.equals(Base64.decodeToByteArray(encs[i]), src));
			}

			// Discards non-decodable characters and remainder
			assert(Base64.decode('Zm9v^^YmFy'), 'foo');
			assert(ArrayUtil.equals(Base64.decodeToByteArray('Zm9v^^YmFy'), Hex.toArray(Hex.fromString('foo'))));
		}

	}

}
