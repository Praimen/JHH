package view
{
	/**
	 *https://Praimen@github.com/Praimen/JHH.git 
	 */	
	import controller.IAnimation;
	import controller.IController;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.utils.Dictionary;
	
	import trh.helpers.PanelEvent;
	
	
	public class ViewMCV extends Sprite implements IViewMCV
	{
		private var thisView:DisplayObject;
		private var _viewController:IController;
		private var _animController:IAnimation;
		private var buildPanels:ViewPanel;	
		public var panelRegister:Dictionary = new Dictionary();
		

		public function ViewMCV(whichController:IController,whichAnimController:IAnimation)
		{
			//with extraction of ViewPanel from Login and other child panels different 
			//animation sets can be built and grouped to different panels
			
			this.viewController = whichController;
			_viewController = this.viewController;			
			
			//buildPanels = new ViewPanel(0,0);
			//buildPanels.panelController = _viewController
			addEvents();
			buildGUI();
			
		}
		
		public function buildGUI():void{
			var login:Login = new Login(20,20);	
			var stafflogin:Login = new Login(300,300);			

			//login Panel
			//login.name = "login"
			login.addGraphic("assets/images/search_panel2.png", 243, 226);
			login.createTextFields("username",{type:"input", y:15, text:"username"});
			login.createTextFields("password",{type:"input", y:50, text:"password"});						
			login.addButtons(new CloseButton(),{x:login.width, y:0, offX:12, offY:8});
			login.addButtons(new SubmitButton(),{x:login.width, y:login.height,offY:16,offX:12});			
			addToView(login, "login");
			
			
			//2nd window
			//stafflogin.name = "stafflogin"
			stafflogin.addGraphic();	
			stafflogin.createTextFields("username",{type:"input", y:15, text:"username"});
			stafflogin.createTextFields("password",{type:"input", y:50, text:"password"});					
			stafflogin.addButtons(new CloseButton(),{x:stafflogin.width, y:0, offX:12, offY:8});
			stafflogin.addButtons(new SubmitButton(),{x:stafflogin.width, y:stafflogin.height,offY:16,offX:12});			
			addToView(stafflogin, "stafflogin");
			
			///event links must come after all object are on stage
			login.panelEventLink(PanelEvent.DATA_SUCCESS,PanelEvent.PANEL_OPEN, "stafflogin");
			stafflogin.panelEventLink(PanelEvent.DATA_SUCCESS,PanelEvent.PANEL_CLOSE, "login");
		}
		
		private function addToView(panel:ViewPanel, panelname:String):void{
			panel.name = panelname			
			panelRegister[panel] = panelname;
			addChild(panel);			
		}
		
		private function addEvents():void{	
			//now listens for what gets added to the View Stage
			this.addEventListener(Event.ADDED, addController, true);
		}		
		
		private function addController(evt:Event):void{	
			//evt.target is the ViewPanel being added to the View Area
			if(evt.target is ViewPanel){
				evt.stopPropagation();					
				evt.target.panelController = this.viewController;	
			}
		}	
		
		public function set viewController(value:IController):void{
			_viewController = value;
			
		}
		
		public function get viewController():IController{			
			return _viewController;
		}
		
		public function set animController(value:IAnimation):void{			
			_animController = value;
		}
		
		public function get animController():IAnimation{			
			return _animController;
		}
		
	}//End Class
}//End Package