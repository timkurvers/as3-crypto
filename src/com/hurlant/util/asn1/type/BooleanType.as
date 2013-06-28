package com.hurlant.util.asn1.type {
	import flash.utils.ByteArray;
	import flash.net.registerClassAlias;
	
	public class BooleanType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.BooleanType", BooleanType);
		public function BooleanType() {
			super(ASN1Type.BOOLEAN);
		}

		override protected function fromDERContent(s:ByteArray, length:int):* {
			return s.readUnsignedByte() === 0xFF;
		}
	}
}