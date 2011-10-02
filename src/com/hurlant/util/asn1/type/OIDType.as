package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class OIDType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.OIDType", OIDType);
		
		public var oid:String = null;
		
		public function OIDType(s:String = null) {
			super(ASN1Type.OID);
			oid = s; // null = any OID goes here, otherwise, we validate an exact match.
		}
		
		public function toString():String {
			return oid;
		}

		/**
		 * I'm tempted to return fully defined OIDType objects
		 * Altough that's a little bit weird.
		 *  
		 * @param s
		 * @param length
		 * @return 
		 * 
		 */
		protected override function fromDERContent(s:ByteArray, length:int):* {
			var p:int = s.position;
			// parse stuff
			// first byte = 40*value1 + value2
			var o:uint = s.readUnsignedByte();
			var left:int = length - 1;
			var a:Array = [];
			a.push(uint(o/40));
			a.push(uint(o%40));
			var v:uint = 0;
			while(left-- > 0) {
				o = s.readUnsignedByte();
				var last:Boolean = (o&0x80)==0;
				o &= 0x7f;
				v = v*128 + o;
				if (last) {
					a.push(v);
					v = 0;
				}
			}
			var str:String = a.join(".");
			if (oid!=null) {
				if (oid==str) {
					return this.clone();
				} else {
					s.position = p;
					return null;
				}
			} else {
				return new OIDType(str);
			}
		}
	}
}