package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	
	public function implicitTag(v:int, c:int, o:ASN1Type):ASN1Type {
		o = o.clone();
		o.implicitTag = v;
		o.implicitClass = c;
		return o;
	}
}