package openfl.events; #if (!display && !flash)


class UncaughtErrorEvent extends ErrorEvent {
	
	
	public static var UNCAUGHT_ERROR = "uncaughtError";
	
	public var error (default, null):Dynamic;
	
	
	public function new (type:String, bubbles:Bool = true, cancelable:Bool = true, error:Dynamic = null) {
		
		super (type, bubbles, cancelable);
		
		this.error = error;
		
	}
	
	
	public override function clone ():Event {
		
		var event = new UncaughtErrorEvent (type, bubbles, cancelable, error);
		event.target = target;
		event.currentTarget = currentTarget;
		#if !openfl_legacy
		event.eventPhase = eventPhase;
		#end
		return event;
		
	}
	
	
	public override function toString ():String {
		
		return __formatToString ("UncaughtErrorEvent",  [ "type", "bubbles", "cancelable", "error" ]);
		
	}
	
	
}


#else


#if flash
@:native("flash.events.UncaughtErrorEvent")
#end

extern class UncaughtErrorEvent extends ErrorEvent {
	
	
	public static var UNCAUGHT_ERROR:String;
	
	public var error (default, null):Dynamic;
	
	
	public function new (type:String, bubbles:Bool = true, cancelable:Bool = true, error:Dynamic = null);
	
	
}


#end