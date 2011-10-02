package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class SetType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.SetType", SetType);
		
		public var childType:ASN1Type;
		
		public function SetType(p:ASN1Type = null) {
			super(ASN1Type.SET);
			childType = p;
		}

		protected override function fromDERContent(s:ByteArray, length:int):* {
			var p:int = s.position;
			var left:int = length;
			var val:Array, v:*; // v=individual children, val=entire set
			val = []; // unordered in theory, but this will do.
			while (left>0) {
				v = childType.fromDER(s, left);
				if (v==null) {
					throw new Error("couldn't parse DER stream.");
				} else {
					val.push(v);
				}
				left = length - s.position + p; 
			}
			return val;
		}

	}
}