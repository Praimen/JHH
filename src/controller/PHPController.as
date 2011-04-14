package controller{
	
	import flash.events.Event;
	
	import model.IModel;
	
	
	
	public class PHPController implements IController{
		
		private var _controllerModel:IModel;
		//public var _phpController:IController;
		public function PHPController(whichmodel:IModel)
		{			
			_controllerModel = whichmodel;			
		}
		
		public function createData():void
		{
			trace("creating PHPController DATA");
		}
		
		public function readData(dataObj:*):void
		{
			
			trace("reading PHPController DATA");
		}
		
		public function updateData():void
		{
			trace("updating PHPController DATA");
		}
		
		public function deleteData():void
		{
			trace("deleting PHPController DATA");
		}
		
		public function recEvent(event:Event):void
		{
		}
		
		public function retEvent():Event
		{
			return null;
		}
		
		public function get controller():IController{
			trace("phpController get");			
			return this;
		}
		
		
		
	}//End Class
}//End Package