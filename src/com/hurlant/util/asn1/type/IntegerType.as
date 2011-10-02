package com.hurlant.util.asn1.type {
	
	import com.hurlant.math.BigInteger;
	
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class IntegerType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.IntegerType", IntegerType);
		public function IntegerType() {
			super(ASN1Type.INTEGER);
		}
		
		/**
		 * 
		 * @param s
		 * @param length
		 * @return a BigInteger or a int, if it fits within one. 
		 * 
		 */
		protected override function fromDERContent(s:ByteArray, length:int):* {
			var p:int = s.position;
			var left:int = length;
			var b:ByteArray = new ByteArray;
			s.readBytes(b,0,length);
			b.position=0;
			var i:BigInteger = new BigInteger(b);
			// return a primitive type if it fits within one
			if (i.bitLength()<31) {
				return i.intValue();
			} else {
				return i;
			}
		}
	}

}