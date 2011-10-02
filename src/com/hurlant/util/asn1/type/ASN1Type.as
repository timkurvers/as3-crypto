package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	/**
	 * This class represents a chunk of ASN1 definition.
	 * 
	 * This is used by parser to know what to look for.
	 * 
	 * @author henri
	 * 
	 */
	public class ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.ASN1Type", ASN1Type);
		
		// Universal types and tag numbers
		public static const CHOICE:int = -2;
		public static const ANY:int = -1;
		public static const RESERVED:int = 0;
		public static const BOOLEAN:int = 1;
		public static const INTEGER:int = 2;
		public static const BIT_STRING:int = 3;
		public static const OCTET_STRING:int = 4;
		public static const NULL:int = 5;
		public static const OID:int = 6;
		public static const ODT:int = 7;
		public static const EXTERNAL:int = 8;
		public static const REAL:int = 9;
		public static const ENUMERATED:int = 10;
		public static const EMBEDDED:int = 11;
		public static const UTF8STRING:int = 12;
		public static const ROID:int = 13;
		public static const SEQUENCE:int = 16;
		public static const SET:int = 17;
		public static const NUMERIC_STRING:int = 18;
		public static const PRINTABLE_STRING:int = 19;
		public static const TELETEX_STRING:int = 20;
		public static const VIDEOTEX_STRING:int = 21;
		public static const IA5_STRING:int = 22;
		public static const UTC_TIME:int = 23;
		public static const GENERALIZED_TIME:int = 24;
		public static const GRAPHIC_STRING:int = 25;
		public static const VISIBLE_STRING:int = 26;
		public static const GENERAL_STRING:int = 27;
		public static const UNIVERSAL_STRING:int = 28;
		public static const BMP_STRING:int = 30;
		public static const UNSTRUCTURED_NAME:int = 31; // ??? no clue.
		
		// Classes of tags
		public static const UNIVERSAL:int   = 0;
		public static const APPLICATION:int = 1;
		public static const CONTEXT:int     = 2;
		public static const PRIVATE:int     = 3;
		
		// various type modifiers
		public var optional:Boolean = false;
		public var implicitTag:Number = NaN;
		public var implicitClass:int = 0;
		public var explicitTag:Number = NaN;
		public var explicitClass:int = 0;
		public var defaultValue:* = null;
		public var extract:Boolean = false; // if true, the constructed parent will copy the binary value in a [name]_bin slot.
		
		// core type, vs type used somewhere
//		public var core:Boolean = true;
		
		public var defaultTag:Number;
		public var parsedTag:Number; // used for ANY logic
		
		public function ASN1Type(tag:int) {
			defaultTag = tag;
		}

		public function matches(type:int, classValue:int, length:int):Boolean {
			return false;
		}

		public function clone():ASN1Type {
//			if (!core) {
//				return this;
//			}
			var copier:ByteArray = new ByteArray();
//			core = false; // the clone is not core
		    copier.writeObject(this);
		    copier.position = 0;
		    var c:ASN1Type = copier.readObject();
//		    if (c.core) {
//		    	throw new Error("sucks. copy should have core=false");
//		    }
//			core = true;
			return c;
		}
		
		// ok, time to parse some shit

		/**
		 * Read an ASN-1 value from a ByteArray and return it
		 * If we can't read a value that matches our type, we return null;
		 * 
		 * @param s  a ByteArray containing some DER-encoded ASN-1 values.
		 * @return   an ASN1Value object representing the value read. or null.
		 * 
		 */
		public function fromDER(s:ByteArray, size:int):* {
			var p:int = s.position; // We'll reset if things go wrong.
			var length:int;
			aleg: do {
				if (!isNaN(explicitTag)) {
					// unwrap the explicit tag..
					var tag:int = readDERTag(s, explicitClass, true); // explicit tags are always constructed
					if (tag!=explicitTag) {
						break aleg; // haha! The wit.
					}
					length = readDERLength(s);
					// XXX I should use length to validate stuff.
				}
				if (!isNaN(implicitTag)) {
					tag = readDERTag(s, implicitClass);
					if (tag!=implicitTag) {
						break aleg;
					}
				} else {
					tag = readDERTag(s);
					if (defaultTag == ANY) {
						parsedTag = tag;
					} else if (tag!=defaultTag) {
						break aleg;
					}
				}
				length = readDERLength(s);
				var c:* = fromDERContent(s, length);
				if (c==null) {
					break aleg;
				}
				return c;
			} while(false);
			// we failed to parse something meaningful. fall back.
			s.position = p;
			if (defaultValue!=null) {
				return fromDefaultValue();
			}
			return null;
		}
		
		protected function fromDefaultValue():* {
			return defaultValue;
		}
		
		protected function fromDERContent(s:ByteArray, length:int):* {
			throw new Error("pure virtual function call: fromDERContent");
		}
		
		protected function readDERTag(s:ByteArray, classValue:int=UNIVERSAL, 
									constructed:Boolean=false, any:Boolean=false):int {
			var type:int = s.readUnsignedByte();
			var c:Boolean = (type&0x20)!=0;
			var cv:int = (type&0xC0)>>6; // { universal, application, context, private }
			type &= 0x1F;
			if (type == 0x1F) {
				// multibyte tag. blah.
				type=0;
				do {
					var o:int = s.readUnsignedByte();
					var v:int = o&0x7F;
					type = (type<<7) + v;
				} while (o&0x80!=0);
			}
			if (classValue!=cv) {
				// trace("Tag Class Mismatch. expected "+classValue+", found "+cv);
				//return -1; // tag class mismatch // XXX ignore that for now.. :(
			}
			return type;
			// checking for "constructed" is a bit tedious. skip for now. XXX
			//if (any || (c==constructed)) return type;
			//return -1; // constructed flag mismatch.
		}
		
		protected function readDERLength(s:ByteArray):int {
			// length
			var len:int = s.readUnsignedByte();
			if (len>=0x80) {
				// long form of length
				var count:int = len & 0x7f;
				len = 0;
				while (count>0) {
					len = (len<<8) | s.readUnsignedByte();
					count--;
				}
			}
			return len;
		}
	}
}