package controller{
	
	import flash.events.Event;
	
	
	
	
	public class BaseController{		
		
		private var _currentController:IController;
		public function BaseController(currentController:IController)
		{						
			_currentController = currentController;			
			//createData();
			
		}
		
		public function createData():void
		{
			
		_currentController.createData();
			
		}
		
		protected function readData():void
		{
			//this.controller.readData();
			
		}
		
		protected function updateData():void
		{
			
			//this.controller.updateData();
		}
		
		protected function deleteData():void
		{
			//this.controller.deleteData();
		}
		
		protected function recEvent(event:Event):void
		{
		}
		
		protected function retEvent():Event
		{
			return null;
		}
		
		public function set controller(value:IController):void{			
			_currentController = value;
		}
		
		public function get controller():IController{			
			return _currentController;
		}
		
		
		
	}//End Class
}//End Package