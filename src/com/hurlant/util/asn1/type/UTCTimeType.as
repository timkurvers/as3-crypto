package com.hurlant.util.asn1.type {
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	
	public class UTCTimeType extends ASN1Type {
		registerClassAlias("com.hurlant.util.asn1.UTCTime", UTCTimeType);
		
		public function UTCTimeType() {
			super(ASN1Type.UTC_TIME);
		}

		protected override function fromDERContent(s:ByteArray, length:int):* {
			// XXX insufficient
			var str:String = s.readMultiByte(length, "US-ASCII");

			var year:uint = parseInt(str.substr(0, 2));
			if (year<50) {
				year+=2000;
			} else {
				year+=1900;
			}
			var month:uint = parseInt(str.substr(2,2));
			var day:uint = parseInt(str.substr(4,2));
			var hour:uint = parseInt(str.substr(6,2));
			var minute:uint = parseInt(str.substr(8,2));
			// XXX this could be off by up to a day. parse the rest. someday.
			return new Date(year, month-1, day, hour, minute);
		}

	}
}