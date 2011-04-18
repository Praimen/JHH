package view{
	import controller.IController;
	
	
	public interface IViewMCV{
		
		function buildGUI():void;
		function get viewController():IController;
		
		
	}//End Interface
}//End Package