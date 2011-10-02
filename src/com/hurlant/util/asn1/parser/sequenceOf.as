package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.SequenceType;
	
	public function sequenceOf(t:ASN1Type, min:uint=uint.MIN_VALUE, max:uint=uint.MAX_VALUE):ASN1Type {
		return new SequenceType(t);
	}
}