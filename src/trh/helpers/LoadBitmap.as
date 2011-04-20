package trh.helpers
{
	
	/**
	 * var imageLoad:LoadBitmap = new LoadBitmap("assets/images/period_color.png",156,190)	 
	 */	
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	
	public class LoadBitmap
	{
		private var _bitdraw:BitmapData;
		private var _loadedBitmapData:Bitmap;
		private var loader:Loader;
		private var regEvent:Boolean;
		
		public function LoadBitmap(loadURL:String, pixelW:Number, pixelH:Number, listenForEvents:Boolean=false){
			
			initLoadBitmap(loadURL,pixelW,pixelH);
			this.regEvent = listenForEvents;
		}
		
		private function initLoadBitmap(loadURL:String, pixelW:Number, pixelH:Number):void{
			
			_bitdraw = new BitmapData(pixelW,pixelH, true, 0x00000000);
			loader = new Loader();			
			loader.contentLoaderInfo.addEventListener( Event.COMPLETE, initBitmap );	
			loader.load(new URLRequest(loadURL));	
			
		}
		
		private function initBitmap(event:Event):void{			
			_bitdraw.draw(loader);			
			loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, initBitmap );
			loader = null
				
		}	
		
		
		private function bitmapAdded(e:Event):void{	
			
			e.target.parent.dispatchEvent(new PanelEvent(PanelEvent.PANEL_RENDERED));															
		}
		
		///getter and setters
		
		public function get bitmap():Bitmap{	
			_loadedBitmapData = new Bitmap(_bitdraw);
			
			if(regEvent){
			_loadedBitmapData.addEventListener(Event.ADDED, bitmapAdded);
			}
			
			return _loadedBitmapData;
		}
		
		
		
		public function get bitmapData():BitmapData{	
			
			return _bitdraw;
		}
		
	}
}