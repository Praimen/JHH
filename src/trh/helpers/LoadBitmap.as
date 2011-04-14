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
		
		public function LoadBitmap(loadURL:String, pixelW:Number, pixelH:Number){
			
			initLoadBitmap(loadURL,pixelW,pixelH);			
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
		
		public function get bitmap():Bitmap{	
			_loadedBitmapData = new Bitmap(_bitdraw);
			return _loadedBitmapData;
		}
		
		public function get bitmapData():BitmapData{	
			
			return _bitdraw;
		}
		
	}
}