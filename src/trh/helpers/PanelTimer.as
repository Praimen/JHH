package trh.helpers
{
	import flash.utils.Timer;
	
	public class PanelTimer extends Timer
	{
		private var _data:Object;
		public function PanelTimer(delay:Number, repeatCount:int=0)
		{
			//TODO: implement function
			super(delay, repeatCount);
			_data = {};
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
	}//End Class
}//End Package