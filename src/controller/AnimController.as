package controller
{
	public class AnimController 
	{
		
		private var _currentAnimController:IAnimation;
		public function AnimController(animSetControl:IAnimation)
		{						
			this.controller = animSetControl;		
			_currentAnimController = this.controller;		
			
		}
		
		public function set controller(value:IAnimation):void{			
			_currentAnimController = value;
		}
		
		public function get controller():IAnimation{			
			return _currentAnimController;
		}
		
		
		
		
		
		
	}//End Class
}//End Package