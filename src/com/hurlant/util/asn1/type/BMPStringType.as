package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	
	public class BMPStringType extends StringType {
		registerClassAlias("com.hurlant.util.asn1.BMPStringType", BMPStringType);
		
		public function BMPStringType( size1:int=int.MAX_VALUE, size2:int=0) {
			super(ASN1Type.BMP_STRING, size1, size2);
		}
	}
}