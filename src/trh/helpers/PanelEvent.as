package trh.helpers
{
	import flash.events.Event;
	
	public class PanelEvent extends Event
	{
		
		public static const DATA_SUCCESS:String = "data success";
		public static const DATA_FAIL:String = "data fail";
		public static const PANEL_OPEN:String = "panel open";
		public static const PANEL_CLOSED:String = "panel closed";	
		public static const PANEL_RENDERED:String = "panel rendered";
		public var params:Object;
		
		public function PanelEvent(type:String, params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
		
		
		///required override
		public override function clone():Event{
			return new PanelEvent(type, params, bubbles, cancelable);
		}
		
		public override function toString():String{
			return formatToString("PanelEvent", "params", "type", "bubbles", "cancelable");		
		}
		
	}
}