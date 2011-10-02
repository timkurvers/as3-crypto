package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class BitStringType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.BitStringType", BitStringType);

		public function BitStringType() {
			super(ASN1Type.BIT_STRING);
		}

		protected override function fromDERContent(s:ByteArray, length:int):* {
			// structure: one byte telling us how many bits of padding we have
			//            length-1 bytes of actual data.
			// I don't really feel like dealing with bitstrings that don't fit exactly in bytes, though. XXX
			s.readUnsignedByte(); // I could assert if this is not zero, at least. FIXME
			var b:ByteArray = new ByteArray;
			s.readBytes(b, 0, length-1);
			return b;
		}
	}
}