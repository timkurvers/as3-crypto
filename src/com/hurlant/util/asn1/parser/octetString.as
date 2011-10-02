package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.OctetStringType;
	
	public function octetString():ASN1Type {
		return new OctetStringType;
	}
}