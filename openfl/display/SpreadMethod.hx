package openfl.display; #if (!display && !flash) #if !openfl_legacy


enum SpreadMethod {
	
	REPEAT;
	REFLECT;
	PAD;
	
}


#else
typedef SpreadMethod = openfl._legacy.display.SpreadMethod;
#end
#else


/**
 * The SpreadMethod class provides values for the <code>spreadMethod</code>
 * parameter in the <code>beginGradientFill()</code> and
 * <code>lineGradientStyle()</code> methods of the Graphics class.
 *
 * <p>The following example shows the same gradient fill using various spread
 * methods:</p>
 */

#if flash
@:native("flash.display.SpreadMethod")
#end

@:fakeEnum(String) extern enum SpreadMethod {
	
	/**
	 * Specifies that the gradient use the <i>repeat</i> spread method.
	 */
	REPEAT;
	
	/**
	 * Specifies that the gradient use the <i>reflect</i> spread method.
	 */
	REFLECT;
	
	/**
	 * Specifies that the gradient use the <i>pad</i> spread method.
	 */
	PAD;
	
}


#end