/**
 * ArrayUtilTest
 *
 * Tests for array utility
 *
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests.util {

	import com.hurlant.tests.*;

	import com.hurlant.util.ArrayUtil;
	import com.hurlant.util.Hex;

	import flash.utils.ByteArray;

	public class ArrayUtilTest {

		[Test]
		public function equals():void {
			var a:ByteArray = Hex.toArray('BADA5500');
			var b:ByteArray = Hex.toArray('BADA5500');
			var c:ByteArray = Hex.toArray('B00B00');
			assert(ArrayUtil.equals(a, b));
			assert(!ArrayUtil.equals(a, c));
		}

	}

}
