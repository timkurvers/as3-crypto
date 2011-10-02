package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.PrintableStringType;
	
	public function printableString(size:int=int.MAX_VALUE,size2:int=0):ASN1Type {
		return new PrintableStringType(size, size2);
	}
}