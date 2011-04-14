package trh.helpers
{
	import flash.events.Event;
	
	public class ButtonEvent extends Event
	{	
		// event constants		
		public static const CLOSED:String = "closed";
		public static const CLEAR:String = "clear";
		public static const SUBMIT:String = "submit";			
		public var params:Object;
	
		public function ButtonEvent(type:String, params:Object=null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
		
		///required override
		public override function clone():Event{
			return new ButtonEvent(type, params, bubbles, cancelable);
		}
		
		public override function toString():String{
			return formatToString("CustomEvent", "params", "type", "bubbles", "cancelable");		
		}

		
	}
}
