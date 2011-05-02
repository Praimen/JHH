package view
{
	import flash.events.*;
	
	import trh.helpers.*;
	
	public class CloseButton extends ViewButton implements IGui
	{
		private var panelBackURL:String = "assets/images/close_button.png";
		private var pWidth:Number = 24;
		private var pHeight:Number = 24;
		public function CloseButton(matterGUI:Object=null){
			super();
			super.viewMatter = matterGUI;
		
		}
		
		override public function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void{
			if(urlString == null){
				super.addGraphic(panelBackURL,pWidth,pHeight);
			}else{
				super.addGraphic(urlString,pxWid,pxHgt);
			}			
		}
		
		override public function addEvents():void{		
			this.addEventListener(MouseEvent.MOUSE_UP, function(e:Event):void{
				e.target.dispatchEvent(new PanelEvent(PanelEvent.PANEL_CLOSE));
				
			});
			
		}
		
		override public function addAnimations():void{			
		}
		
		override public function createTextFields(label:String,textAttr:Object):void{			
			//uses Text field  wrapper class ViewTextField 	
			trace("add close label");			
		}
		
	}
}