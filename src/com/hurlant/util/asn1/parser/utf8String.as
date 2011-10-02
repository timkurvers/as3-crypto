package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.UTF8StringType;
	
	public function utf8String(size:int=int.MAX_VALUE,size2:int=0):UTF8StringType {
		return new UTF8StringType(size, size2);
	}
}