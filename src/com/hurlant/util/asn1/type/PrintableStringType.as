package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	
	public class PrintableStringType extends StringType {
		registerClassAlias("com.hurlant.util.asn1.PrintableStringType", PrintableStringType);
		
		public function PrintableStringType(size1:int=int.MAX_VALUE, size2:int=0) {
			super(ASN1Type.PRINTABLE_STRING, size1, size2);
		}
	}
}