package trh.helpers
{
	import flash.events.Event;
	
	public class PanelEvent extends Event
	{
		
		public static const PANEL_CLEAR:String = "panel clear";
		public static const PANEL_CLOSE:String = "panel close";	
		public static const DATA_FAIL:String = "data fail";		
		public static const PANEL_OPEN:String = "panel open";		
		public static const PANEL_RENDERED:String = "panel rendered";
		public static const PANEL_SUBMIT:String = "panel submit";
		public static const DATA_SUCCESS:String = "data success";
		
		public var params:Object;
		
		public function PanelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, params:Object=null)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
		
		
		///required override
		override public  function clone():Event{
			return new PanelEvent(type, bubbles, cancelable, params);
		}
		
		override public function toString():String{
			return formatToString("PanelEvent", "type", "bubbles", "cancelable","params");		
		}
		
	}
}