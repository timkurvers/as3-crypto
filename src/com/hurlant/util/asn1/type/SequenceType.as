package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class SequenceType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.SequenceType", SequenceType);
		
		public var children:Array;
		public var childType:ASN1Type;
		
		public function SequenceType(p:* = null) {
			super(ASN1Type.SEQUENCE);
			if (p is Array) {
				children = p as Array;
			} else {
				childType = p as ASN1Type;
			}
		}
		
		protected override function fromDERContent(s:ByteArray, length:int):* {
			var p:int = s.position;
			var left:int = length;
			var val:*, v:*; // v=individual children, val=entire sequence
			if (children!=null) {
				// sequence
				val = {};
				for (var i:int=0;i<children.length;i++) {
					for (var name:String in children[i]) {
						var pp:int = s.position;
						left = length - pp + p; 
						var child:ASN1Type = children[i][name];
						v = child.fromDER(s, left);
						if (v == null) {
							if (child.optional) {
								// do nothing. it's okay not to find it.
							} else {
								s.position = p;
								return null;
								//throw new Error("couldn't parse DER stream.");
							}
						} else {
							val[name] = v;
							if (child.extract) {
								var bin:ByteArray = new ByteArray;
								bin.writeBytes(s, pp, s.position-pp);
								val[name+"_bin"] = bin;
							}
						} 
					}
				}
				return val;
			} else {
				// sequenceOf
				val = [];
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
}