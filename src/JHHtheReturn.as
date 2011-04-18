package{
	import controller.*;
	
	import flash.display.Sprite;
	
	import model.*;
	
	import view.*;
	[SWF(backgroundColor="#666666", frameRate="100", width="900", height="600")]
	
	public class JHHtheReturn extends Sprite{
		private var masterView:ViewMCV;
		private var viewModel:IModel;
		private var viewController:IController;
		private var currentViewControl:BaseController;
	
	
		public function JHHtheReturn()	{
			//viewModel is the particular model being used
			viewModel = new ModelTwo();
			
			// viewController is the controller with the model being passed to it to use
			viewController = new ZendController(viewModel);
			
			//currentViewControl is the hub for all controllers
			currentViewControl = new BaseController(viewController);
			
			//masterView is the entire view structure with the current controller being passed
			masterView = new ViewMCV(currentViewControl.controller);			
			addChild(masterView);
		
			
		}
	}
}