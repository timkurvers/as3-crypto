package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	
	public class TeletexStringType extends StringType {
		registerClassAlias("com.hurlant.util.asn1.TeletexStringType", TeletexStringType);
		
		public function TeletexStringType(size1:int=int.MAX_VALUE, size2:int=0) {
			super(ASN1Type.TELETEX_STRING, size1, size2);
		}
	}
}