package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	
	public class UniversalStringType extends StringType {
		registerClassAlias("com.hurlant.util.asn1.UniversalStringType", UniversalStringType);
		
		public function UniversalStringType(size1:int=int.MAX_VALUE, size2:int=0) {
			super(ASN1Type.UNIVERSAL_STRING, size1, size2);
		}
	}
}