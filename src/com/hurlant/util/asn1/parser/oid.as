package com.hurlant.util.asn1.parser {
	import com.hurlant.util.asn1.type.OIDType;
	
	public function oid(...p):OIDType {
		var s:String = p.length>0?p.join("."):null;
		return new OIDType(s);
	}
}