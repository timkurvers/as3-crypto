package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class ChoiceType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.ChoiceType", ChoiceType);
		
		public var choices:Array;
		
		public function ChoiceType(p:Array = null) {
			super(ASN1Type.CHOICE);
			choices = p;
		}
		
		public override function fromDER(s:ByteArray, size:int):* {
			// just loop through each choice until one of them is non-null
			// XXX this will fail horribly if one of the choices has a default value.
			// I kinda hope that's forbidden by common sense somewhere.
			for (var i:int=0;i<choices.length;i++) {
				var c:* = choices[i];
				for (var name:String in c) {
					var choice:ASN1Type = c[name];
					var v:* = choice.fromDER(s, size);
					if (v !=null) {
						var val:* = {};
						val[name] = v;
						return val;
					}
				}
			}
			return null;
		}

	}
}