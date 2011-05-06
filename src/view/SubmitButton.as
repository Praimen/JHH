package view
{
	import flash.events.*;	
	import trh.helpers.*;

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
			
			this.addEventListener(MouseEvent.MOUSE_UP, function(e:Event):void{
				e.target.parent.dispatchEvent(new PanelEvent(PanelEvent.PANEL_SUBMIT));
				
			});	
		}
		
		override public function addAnimations():void{
			
		}
		
		override public function createTextFields(label:String,textAttr:Object):void{			
			//uses Text field  wrapper class ViewTextField 	
			trace("add submit label");			
		}
		
		
	}//End Class
}//End Package