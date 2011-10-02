package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.BooleanType;
	
	public function boolean():ASN1Type {
		return new BooleanType;
	}
}