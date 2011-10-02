package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.UniversalStringType;
	
	public function universalString(size:int=int.MAX_VALUE,size2:int=0):UniversalStringType {
		return new UniversalStringType(size, size2);
	}
}