package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	
	public class UTF8StringType extends StringType {
		registerClassAlias("com.hurlant.util.asn1.UTF8String", UTF8StringType);
		
		public function UTF8StringType(size1:int=int.MAX_VALUE, size2:int=0) {
			super(ASN1Type.UTF8STRING, size1, size2);
		}
		
	}
}