package view{
	import controller.*;
	
	import trh.helpers.ButtonEvent;
		
	public class Login extends ViewPanel{
		
		private var panelBackURL:String = "assets/images/error_panel.png";
		private var pWidth:Number = 243;
		private var pHeight:Number = 197;			
		
		public function Login(x:Number,y:Number,controller:IController){	
			super(x,y,controller);
			//loginTextField = super.textfield;			
		}
		
		override public function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void{
			if(urlString == null){
				super.addGraphic(panelBackURL,pWidth,pHeight);
			}else{
				super.addGraphic(urlString,pxWid,pxHgt);
			}
		}
		//use commented portions as templates should they be necessary
		/*
		override public function addEvents():void{
			super.addEvents();
		}
		
		override public function addAnimations():void{
			super.addAnimations();
			//override to change animation sets
		}
		
		override public function addTextFields(label:String,textAttr:Object):void{				
			loginTextField.addViewTextField(label,textAttr);			
			this.addChild(loginTextField);			
		}
		
				
		override public function addButtons(buttons:ViewButton,btnAttr:Object):void{
			super.addButtons(buttons,btnAttr);						
			
		}
		
		override public function clearAction(evt:ButtonEvent):void{	
			super.clearAction(evt);			
		}
		
		override public function closeAction(evt:ButtonEvent):void{
			super.closeAction(evt);		
		}
		
		override public function submitAction(evt:ButtonEvent):void{			
			super.submitAction(evt)
		
		}*/
		
	}//End Class
}//End Package