package view
{
	import controller.*;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.utils.Dictionary;
	
	import trh.helpers.*;
	
	import view.components.ViewTextField;
	
	
	
	public class ViewPanel extends Sprite implements IGui{
		private var panelBackURL:String = "assets/images/error_panel.png";
		private var imageLoad:LoadBitmap;
		protected var animations:IAnimation;
		protected var textfield:ViewTextField;
		protected var panelTextFields:Array;
		protected var _panelController:IController;
		
		public function ViewPanel(x:Number,y:Number){	
			this.x = x;
			this.y = y;			
			
			
			//set textfield and default text field numbers
			textfield = new ViewTextField({x:15,height:25, width:150,background:true});
			panelTextFields = new Array;
			addEvents();
			addAnimations();
			
		}		
		
		public function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void{
			//override if bitmaps are not needed				
					imageLoad = new LoadBitmap(urlString,pxWid,pxHgt, true);							
				this.addChild(imageLoad.bitmap);				
				this.width = pxWid;
				this.height = pxHgt;			
		}
		
		public function addEvents():void{	
			this.addEventListener(PanelEvent.PANEL_RENDERED, addTextFields)
			this.addEventListener(ButtonEvent.CLEAR,clearAction, true);
			this.addEventListener(ButtonEvent.CLOSED,closeAction);
			this.addEventListener(ButtonEvent.SUBMIT,submitAction, true);					
			
		}
		
		public function addAnimations():void{
		//use to add default animation sets to all buttons	
		}
		
		public function createTextFields(label:String,textAttr:Object):void{
		//uses Text field  wrapper class ViewTextField 	
			textfield.addViewTextField(label,textAttr);	
			panelTextFields.push(textfield);
			
					
		}
		
		private function addTextFields(pEvt:PanelEvent):void{
			pEvt.stopPropagation();
			trace(panelTextFields.length);
			
			for each(var txtField:ViewTextField in panelTextFields){				
				addChild(txtField);
			}
			
			//need something that would tell the panel to be visible
		}		
		
		public function addButtons(buttons:ViewButton,btnAttr:Object):void{
		//add Class buttons	
			var panelBtn:ViewButton = buttons;	
			addChild(panelBtn);			
			panelBtn.x = (btnAttr.x <= this.width - panelBtn.width) ? btnAttr.x + btnAttr.offX : this.width - panelBtn.width - btnAttr.offX;
			panelBtn.y = (btnAttr.y <= this.height - panelBtn.height) ?  btnAttr.y + btnAttr.offY : this.height - panelBtn.height - btnAttr.offY;
			
		}
		
		public function clearAction(evt:ButtonEvent):void{			
			trace("this panel text fields have been cleared");
		}
		
		public function closeAction(evt:ButtonEvent):void{			
			evt.currentTarget.visible = false;
		}
		
		public function submitAction(evt:ButtonEvent):void{
			var panelTarget:Event = evt;
			evt.stopPropagation();
			var submitData:Array = new Array();
			
			for each(var textData:Object in textfield.textArray){	
				var key:String = textData.label;
				var value:String = textData.textfield.text;				
				submitData[key] = value;				
			}
						
			this.panelController.readData(panelTarget,submitData);
						
		}				
		
		public function dataSuccess(pEvt:PanelEvent):void{
			
			//should run animations, open or close other windows
			trace(this + "data works");
			this.visible = false;
		}
		
		public function dataFail(pEvt:PanelEvent):void{
			trace(this + "data fail");
			this.visible = true;
			//should run animations, open or close other window, show error messages
		}
		
		/////getter and setters/////
		
				
		public function set panelController(value:IController):void{			
			
			this._panelController = value;
		}
		
		public function get panelController():IController{			
			
			return _panelController;
		}
		
		
		
		
	}//End Class
}//End Package