package view.components
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;

	public class ViewTextField extends Sprite{
		
		private var textArea:TextField;
		private var initValue:Object;
		private var _label:String;
		private var _textFieldArr:Array;
		
		public function ViewTextField(defaultValue:Object){
			initValue = new Object();
			_textFieldArr = [];
			initValue.x = (defaultValue.x) ? defaultValue.x as Number : 0;
			initValue.y = (defaultValue.y) ? defaultValue.y as Number : 0;
			initValue.width = (defaultValue.width) ? defaultValue.width as Number : 50;
			initValue.height = (defaultValue.height) ? defaultValue.height as Number : 15;
			initValue.background = (defaultValue.background) ? defaultValue.background : false ;
			initValue.backgroundColor = (defaultValue.backgroundColor) ? defaultValue.backgroundColor as uint : 0xFFFFFF;
			initValue.multiline = (defaultValue.multiline) ? defaultValue.multiline : false;
			initValue.border = (defaultValue.border) ? defaultValue.border : true;
			initValue.type = (defaultValue.type) ? defaultValue.type : "input";
			initValue.text = (defaultValue.text) ? defaultValue.text : " ";			
		}
		
		public function addViewTextField(addlabel:String,textInit:Object):void{
			
			textArea = new TextField();
			this.label = addlabel;
			//this needs init object type like Away3d
			textArea.x = (textInit.x || textInit.x == 0) ? textInit.x as Number : initValue.x;			
			textArea.y = (textInit.y || textInit.y == 0) ? textInit.y as Number : initValue.y;
			textArea.multiline = (textInit.multiline) ? textInit.multiline as Boolean : initValue.multiline;	
			textArea.height = (textInit.height) ? textInit.height as Number : initValue.height;
			textArea.width = (textInit.width) ? textInit.width as Number : initValue.width;
			textArea.border = (textInit.border) ? textInit.border as Boolean : initValue.border;
			textArea.background = (textInit.background) ? textInit.background as Boolean : initValue.background;
			textArea.backgroundColor = (textInit.backgroundColor) ? textInit.backgroundColor as uint : initValue.backgroundColor;	
			textArea.type = (textInit.type) ? textInit.type as String : initValue.type;
			textArea.text = (textInit.text) ? textInit.text as String : initValue.text;	
			var textArrObj:Object = new Object();
			textArrObj.label = this.label;
			textArrObj.textfield = textArea;
			_textFieldArr.push(textArrObj);
			this.addChild(textArea);			
		}
		
		
		public function addTextBackGround(urlString:String=null, sizeX:Number=0, sizeY:Number=0):void{			
			//use to add custom graphic background to text areas
		}
		
		public function get textArray():Array{
			//this needs to be expanded to include other component types and values
			return _textFieldArr;
		}
		
		public function set label(value:String):void{
			
			this._label = value;
		}
		
		public function get label():String{
			
			return _label;
		}
		
		
	}//End Class
}//End Package