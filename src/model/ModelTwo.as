package model{
	
	
	public class ModelTwo extends BaseModel{
		private var _thisModel:IModel;
		public function ModelTwo()
		{
			super();
			_thisModel = this.model;
		}
		
		override public function get model():IModel
		{
			return _thisModel;
		}
		
	}//End Class
}//End Package