package com.hurlant.util.asn1.type {
	import flash.utils.ByteArray;
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class BooleanType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.BooleanType", BooleanType);
		public function BooleanType() {
			super(ASN1Type.BOOLEAN);
		}
		
		/**
		 * 
		 * @param s
		 * @param length
		 * @return a Boolean 
		 * 
		 */
		protected override function fromDERContent(s:ByteArray, length:int):* {
			return s.readBoolean();
		}
	}
}