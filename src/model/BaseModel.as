package model{
	
	
	public class BaseModel implements IModel{
		
		private var _thisModel:IModel;
		public function BaseModel()
		{
			
			_thisModel = this;
		}
		
		public function get model():IModel
		{
			return _thisModel;
		}
		
	}//End Class
}//End Package