package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.ASN1Type;
	import com.hurlant.util.asn1.type.SequenceType;
	
	public function sequence(...p):ASN1Type {
		var a:Array = [];
		for (var i:int=0;i<p.length;i++) {
			a[i] = p[i];
		}
		return new SequenceType(a);
		
	}
}