/**
 * AS3CryptoTests
 *
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests {

	import com.hurlant.tests.crypto.hash.*;
	import com.hurlant.tests.crypto.prng.*;
	import com.hurlant.tests.crypto.rsa.*;
	import com.hurlant.tests.crypto.symmetric.*;
	import com.hurlant.tests.math.*;
	import com.hurlant.tests.util.*;

	import flash.display.Sprite;
	import flash.events.Event;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	/**
	 * as3-crypto unit tests runner
	 */
	public class AS3CryptoTests extends Sprite {

		/**
		 * Collection of tests to be run
		 */
		public static const tests:Array = [
			HMACTest,
			MD2Test,
			MD5Test,
			SHA1Test,
			SHA224Test,
			SHA256Test,

			ARC4Test,
			TLSPRFTest,

			RSAKeyTest,

			AESKeyTest,
			BlowFishKeyTest,
			CBCModeTest,
			CFB8ModeTest,
			CFBModeTest,
			CTRModeTest,
			DESKeyTest,
			ECBModeTest,
			OFBModeTest,
			TripleDESKeyTest,
			XTeaKeyTest,

			BigIntegerTest,

			ArrayUtilTest,
			Base64Test,
			HexTest
		];

		/**
		 * Reference to the FlexUnit core
		 */
		private var _core:FlexUnitCore = null;

		/**
		 * Constructor setting up the initialization listener
		 */
		public function AS3CryptoTests() {
			this.addEventListener(Event.ADDED_TO_STAGE, _init);
		}

		/**
		 * Initialization handler setting up the FlexUnit core, adding a listener and ultimately running the tests
		 */
		private function _init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, _init);

			_core = new FlexUnitCore();
			_core.addListener(new TraceListener());
			_core.run(tests);
		}

	}

}
