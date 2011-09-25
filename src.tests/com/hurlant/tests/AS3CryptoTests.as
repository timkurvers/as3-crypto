/**
 * AS3CryptoTests
 * 
 * @author	Tim Kurvers <tim@moonsphere.net>
 */
package com.hurlant.tests {

	import flash.events.Event;
	import flash.display.Sprite;

	import com.hurlant.crypto.tests.*;
	
	/**
	 * as3-crypto unit tests runner
	 */
	public class AS3CryptoTests extends Sprite implements ITestHarness {
		
		/**
		 * Collection of testcases to run
		 */
		public static const cases:Array = [
			AESKeyTest,
			ARC4Test,
			BigIntegerTest,
			BlowFishKeyTest,
			CBCModeTest,
			CFB8ModeTest,
			CFBModeTest,
			CTRModeTest,
			DESKeyTest,
			ECBModeTest,
			HMACTest,
			MD2Test,
			MD5Test,
			OFBModeTest,
			RSAKeyTest,
			SHA1Test,
			SHA224Test,
			SHA256Test,
			TLSPRFTest,
			TripleDESKeyTest,
			XTeaKeyTest
			];
		
		/**
		 * Reference to current test index
		 */
		protected var _current:uint = 0;
		
		/**
		 * Passed/failed counters
		 */
		protected var _passed:uint = 0;
		protected var _failed:uint = 0;
		
		/**
		 * Constructor setting up the initialization listener
		 */
		public function AS3CryptoTests() {
			this.addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		/**
		 * Initialization handler running all tests
		 */
		private function _init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, _init);
			
			trace('$ as3crypto unit-tests $');
			
			for each(var cls:Class in cases) {
				new cls(this);
			}
			
			trace('------------------');
			trace('Passed: ' + _passed);
			trace('Failed: ' + _failed);
		}
		
		/**
		 * @inheritDoc
		 */
		public function beginTestCase(name:String):void {
			trace('[' + name + ']');
		}
		
		/**
		 * @inheritDoc
		 */
		public function endTestCase():void { }
		
		/**
		 * @inheritDoc
		 */
		public function beginTest(name:String):void {
			trace('  #' + (++_current) + ': ' + name);
		}
		
		/**
		 * @inheritDoc
		 */
		public function passTest():void {
			++_passed;
		}
		
		/**
		 * @inheritDoc
		 */
		public function failTest(msg:String):void {
			trace(' > FAIL: ' + msg);
			++_failed;
		}
		
	}
	
}
