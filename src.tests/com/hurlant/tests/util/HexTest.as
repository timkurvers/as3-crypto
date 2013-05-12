/**
 * HexTest
 *
 * Tests for hex utility
 *
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests.util {

	import com.hurlant.tests.*;
	import com.hurlant.util.ArrayUtil;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	public class HexTest {

		[Test]
		public function toArray():void {
			var ba:ByteArray = new ByteArray();
			ba.writeByte(0x00);
			ba.writeByte(0xBA);
			ba.writeByte(0xDA);
			ba.writeByte(0x55);
			ba.writeByte(0x00);

			// Varied casing
			assert(ArrayUtil.equals(Hex.toArray('00bada5500'), ba));
			assert(ArrayUtil.equals(Hex.toArray('00BADA5500'), ba));

			// Without first nibble
			assert(ArrayUtil.equals(Hex.toArray('0BADA5500'), ba));

			// Prefixed
			assert(ArrayUtil.equals(Hex.toArray('0x00BADA5500'), ba));

			// Colon-laced
			assert(ArrayUtil.equals(Hex.toArray('00:BA:DA:55:00'), ba));

			// Whitespaced
			assert(ArrayUtil.equals(Hex.toArray('00 BA DA 55 00'), ba));
		}

		[Test]
		public function fromArray():void {
			var ba:ByteArray = new ByteArray();
			ba.writeByte(0x00);
			ba.writeByte(0xBA);
			ba.writeByte(0xDA);
			ba.writeByte(0x55);
			ba.writeByte(0x00);

			assert(Hex.fromArray(ba), '00bada5500');
		}

		[Test]
		public function toString():void {
			assert(Hex.toString('61733363727970746f'), 'as3crypto');

			assert(Hex.toString('e2b8ae'), '⸮');
			assert(Hex.toRawString('e2b8ae'), 'â¸®');
		}

		[Test]
		public function fromString():void {
			assert(Hex.fromString('as3crypto'), '61733363727970746f');

			assert(Hex.fromString('⸮'), 'e2b8ae');
			assert(Hex.fromRawString('â¸®'), 'e2b8ae');
		}

	}

}
