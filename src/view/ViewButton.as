package view{
		
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.*;
	
	import trh.helpers.*;
	import view.components.ViewTextField;
	
	public class ViewButton extends Sprite implements IGui{
		
		private var imageLoad:LoadBitmap;
		
		protected var textfield:ViewTextField;
		protected var viewMatter:Object;
		public function ViewButton(matterGUI:Object=null)
		{
			
			viewMatter = matterGUI;
			buttonMode = true;			
			addEvents();
			addGraphic();
		}
		
		public function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void{			
				imageLoad = new LoadBitmap(urlString,pxWid,pxHgt);
				addChild(imageLoad.bitmap);
				
				//may need to have an event dipatched since other graphic elements rely on image for positioning
		}
		
		public function addEvents():void{			
			
		}
		
		public function addAnimations():void{
			
		}
		
		public function addTextFields(label:String,textAttr:Object):void{
			//uses Text field  wrapper class ViewTextField 	
			
		}
		
		
		//setter getter
		
		
	}//End Class
}//End Package