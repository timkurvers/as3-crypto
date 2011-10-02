package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;

	public class OctetStringType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.parser.OctetStringType", OctetStringType);
		
		public function OctetStringType() {
			super(ASN1Type.OCTET_STRING);
		}
		
		protected override function fromDERContent(s:ByteArray, length:int):* {
			var b:ByteArray = new ByteArray;
			s.readBytes(b, 0, length);
			return b;
		}
	}
}