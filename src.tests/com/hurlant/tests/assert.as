package com.hurlant.tests {

	import org.flexunit.Assert;

	/**
	 * Shorthand assertion handler
	 */
	public function assert(...args):void {
		if(args.length === 1) {
			Assert.assertTrue(args[0]);
		}else{
			Assert.assertStrictlyEquals.apply(null, args);
		}
	}

}
