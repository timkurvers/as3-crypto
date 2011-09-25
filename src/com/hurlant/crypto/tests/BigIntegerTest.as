/**
 * BigIntegerTest
 * 
 * A test class for BigInteger
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tests
{
	import com.hurlant.math.BigInteger;
	
	import flash.utils.ByteArray;
	
	public class BigIntegerTest extends TestCase
	{
		public function BigIntegerTest(h:ITestHarness)
		{
			super(h, "BigInteger Tests");
			runTest(testAdd, "BigInteger Addition");
			runTest(testSigned, "BigInteger Signed number conversion");
			runTest(testSigned2, "BigInteger to Number: signed numbers");
			h.endTestCase();
		}
		
		public function testAdd():void {
			var n1:BigInteger = BigInteger.nbv(25);
			var n2:BigInteger = BigInteger.nbv(1002);
			var n3:BigInteger = n1.add(n2);
			var v:int = n3.valueOf();
			assert("25+1002 = "+v, 25+1002==v);

			var p:BigInteger = new BigInteger("e564d8b801a61f47", 16, true);
			var xp:BigInteger = new BigInteger("99246db2a3507fa", 16, true);
			
			xp = xp.add(p);
			
			assert("xp==eef71f932bdb2741", xp.toString(16)=="eef71f932bdb2741");
		}
		
		public function testSigned():void {
            var i1:BigInteger = new BigInteger("1");
            var i2:BigInteger = new BigInteger("2");
            var i3:BigInteger = i1.subtract(i2);
            var arr_i3:ByteArray = i3.toByteArray(); // FF
            var i4:BigInteger = new BigInteger(arr_i3);
            var arr_i4:ByteArray = i4.toByteArray(); // FF
            var equal:Boolean = i3.equals(i4);
            assert("arr_i3.length==1", arr_i3.length==1);
            assert("arr_i4.length==1", arr_i4.length==1);
            assert("-1 == BigInteger(ByteArray(-1))", i3.equals(i4) ); 
		}
		
		public function testSigned2():void {
			var i1:BigInteger = BigInteger.nbv(-13);
			assert("i1==-13", i1.valueOf()==-13);
		}
		
	}
}