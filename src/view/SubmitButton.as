package view
{
	import flash.events.MouseEvent;	
	import trh.helpers.ButtonEvent;

	public class SubmitButton extends ViewButton implements IGui
	{		
		private var panelBackURL:String = "assets/images/search_button_blue_sm.png";
		private var pWidth:Number = 125;
		private var pHeight:Number = 30;
		public function SubmitButton(matterGUI:Object=null)
		{
			super();
			super.viewMatter = matterGUI;
			
			
		}
		
		override public function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void
		{
			if(urlString == null){
				super.addGraphic(panelBackURL,pWidth,pHeight);
			}else{
				super.addGraphic(urlString,pxWid,pxHgt);
			}			
		}
		
		override public function addEvents():void{
			
			this.addEventListener(MouseEvent.MOUSE_UP, function():void{
				dispatchEvent(new ButtonEvent(ButtonEvent.SUBMIT))}			
			);			
		}
		
		override public function addAnimations():void{
			
		}
		
		override public function addTextFields(label:String,textAttr:Object):void{			
			//uses Text field  wrapper class ViewTextField 	
			trace("add submit label");			
		}
		
		
	}//End Class
}//End Package