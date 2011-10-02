package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class AnyType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.AnyType", AnyType);
		public function AnyType() {
			super(ASN1Type.ANY);
			throw new Error("the ASN-1 ANY type is NOT IMPLEMENTED");
		}

		/**
		 * hmm. this is similar to what we used to do.
		 * Typeless parsing. fun.
		 * And yet, this is now somewhat harder to do. :(
		 *  
		 * @param s
		 * @param length
		 * @return 
		 * 
		 */
		protected override function fromDERContent(s:ByteArray, length:int):* {
			// hmmm I have the universal type found in parsedTag
			// but then what?
			// do I need a factory that returns a type for it?
			// blah. pain in the butt.
			trace("ANY parsing not implemented :(");
			switch (parsedTag) {
				case NULL: return "NULL"; // XXX weak sauce
			}
			return null;
		}

	}
}