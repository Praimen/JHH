package view
{
	/**
	 *https://Praimen@github.com/Praimen/JHH.git 
	 */	
	import controller.IAnimation;
	import controller.IController;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	public class ViewMCV extends Sprite implements IViewMCV
	{
		private var thisView:DisplayObject;
		private var _viewController:IController;
		private var _animController:IAnimation;
		private var buildPanels:ViewPanel;	
		public function ViewMCV(whichController:IController)
		{
			//with extraction of ViewPanel from Login and other child panels different 
			//animation sets can be built and grouped to different panels
			
			this.viewController = whichController;
			_viewController = this.viewController;
			buildPanels = new ViewPanel(0,0,viewController);
			
			buildGUI();
		}
		
		public function buildGUI():void{
			//need option to initially hide panel
			var login:Login = new Login(20,20,viewController);	
			login.addGraphic("assets/images/search_panel2.png", 243, 226);
			login.addTextFields("username",{type:"input", y:15, text:"username"});
			login.addTextFields("password",{type:"input", y:50, text:"password"});			
			login.addButtons(new CloseButton(),{x:login.width, y:0, offX:12, offY:8});
			login.addButtons(new SubmitButton(),{x:login.width, y:login.height,offY:16,offX:12});			
			addChild(login);
			
			//2nd window
			var stafflogin:Login = new Login(300,300,viewController);				
			stafflogin.addGraphic();
			stafflogin.addTextFields("username",{type:"input", y:15, text:"username"});
			stafflogin.addTextFields("password",{type:"input", y:50, text:"password"});				
			stafflogin.addButtons(new CloseButton(),{x:stafflogin.width, y:0, offX:12, offY:8});
			stafflogin.addButtons(new SubmitButton(),{x:stafflogin.width, y:stafflogin.height,offY:16,offX:12});			
			addChild(stafflogin);
			
			
		}
		
		
		public function set viewController(value:IController):void{
			_viewController = value;
			
		}
		
		public function get viewController():IController{
			
			return _viewController;
		}
		
		public function get animController():IAnimation{
			
			return _animController;
		}
		
	}//End Class
}//End Package