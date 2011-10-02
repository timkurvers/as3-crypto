package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class StringType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.StringType", StringType);
		
		public var size1:int, size2:int;
		
		public function StringType(tag:int, size1:int=int.MAX_VALUE, size2:int=0) {
			super(tag);
			this.size1 = size1;
			this.size2 = size2;
		}
		
		protected override function fromDERContent(s:ByteArray, length:int):* {
			// XXX insufficient 
			var str:String = s.readMultiByte(length, "US-ASCII");
			return str;
		}
	}
}