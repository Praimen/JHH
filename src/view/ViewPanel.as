package view
{
	import controller.*;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import org.osmf.events.TimeEvent;
	import org.osmf.traits.ViewableTrait;
	
	import trh.helpers.*;
	
	import view.components.ViewTextField;
	
	
	
	public class ViewPanel extends Sprite implements IGui{
		private var panelBackURL:String = "assets/images/error_panel.png";
		protected var imageLoad:LoadBitmap;
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
			
				imageLoad = new LoadBitmap(urlString,pxWid,pxHgt,true);							
				this.addChild(imageLoad.bitmap);
				
				this.width = pxWid;
				this.height = pxHgt;			
		}
		
		public function addEvents():void{	
			this.addEventListener(PanelEvent.PANEL_RENDERED, addTextFields);			
			this.addEventListener(PanelEvent.PANEL_CLEAR,panelClear, true);
			this.addEventListener(PanelEvent.PANEL_CLOSE,panelClose, true);
			this.addEventListener(PanelEvent.PANEL_OPEN,panelOpen, true);
			this.addEventListener(PanelEvent.PANEL_SUBMIT,panelSubmit, true);					
			
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
			var panel:ViewPanel = pEvt.target as ViewPanel;
			pEvt.stopPropagation();
						
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
		
		public function panelClear(pEvt:PanelEvent):void{			
				trace("this panel text fields have been cleared");			
		}
		
		public function panelClose(pEvt:PanelEvent):void{			
				pEvt.currentTarget.visible = false;			
		}
		
		public function panelOpen(pEvt:PanelEvent):void{	
			trace("this panel is being opened " + pEvt.currentTarget)
				pEvt.currentTarget.visible = true;			
		}
		
		public function panelSubmit(pEvt:PanelEvent,linkPanel:ViewPanel=null):void{
			var panelTarget:Event = pEvt;
			pEvt.stopPropagation();
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
			
		}
		
		public function dataFail(pEvt:PanelEvent):void{
			trace(this + "data fail");
			//this.dispatchEvent(new PanelEvent(PanelEvent.PANEL_CLOSE));
			//should run animations, open or close other window, show error messages
		}
		
		
		public function panelEventLink(receive:String, send:String, linkPanel:String):void{			
			this.addEventListener(receive,function(pEvt:PanelEvent):void{				
												var panelDict:Dictionary = new Dictionary;
												panelDict = pEvt.currentTarget.parent.panelRegister;							
											
													for (var key:* in panelDict) {					
														if(panelDict[key] == linkPanel){
															key.dispatchEvent(new PanelEvent(send));
															trace("Object name "+key.name);
														}
													}
															
											});			
		}		
		
		/////getter and setters/////
		
		public function get panel():*{
			
			return this;
		}
		
				
		public function set panelController(value:IController):void{			
			
			this._panelController = value;
		}
		
		public function get panelController():IController{			
			
			return _panelController;
		}
		
		
		
		
	}//End Class
}//End Package