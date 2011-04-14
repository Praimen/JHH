package view
{
	public interface IGui
	{
		
		function addGraphic(urlString:String=null, pxWid:Number=0, pxHgt:Number=0):void;
		function addEvents():void;
		function addAnimations():void;		
		function addTextFields(label:String,textAttr:Object):void;
			
	}
}

