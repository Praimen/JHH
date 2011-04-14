package controller
{
	import flash.events.Event;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	import model.IModel;
	
	import view.ViewPanel;
	
	public class ZendController implements IController
	{
		private var _controllerModel:IModel;
		
		private var nc:NetConnection;		
		private var res:Responder;			
		
		public function ZendController(whichmodel:IModel)
		{	
			nc = new NetConnection();
			
			//possible requirement for validation of data to be specified by the text box in the View Panel
			//then that data would be validated and sanitized based on the text box requirements
		}
						
		public function createData():void
		{
		}
		
		public function readData(panel:Event,dataObj:*):void
		{		
			var viewPanel:ViewPanel = panel.currentTarget as ViewPanel;			
				trace(dataObj.username);	
				checkLogin(dataObj, viewPanel);
				
				/*for each (var item:* in dataObj) {
					trace("key: "+item.key+"  "+"value: "+item.value); 
				}*/
		}
		
		public function updateData():void
		{
		}
		
		public function deleteData():void
		{
		}
		
		public function recEvent(event:Event):void
		{
		}
		
		public function retEvent():Event
		{
			return null;
		}
		
		public function get controller():IController
		{
			return this
		}
		
		
	/////////////////////////////////Heavy lifting this may need to be moved////////////////////////	
		public function loginListener():void{
			
			/*	toggleLoginPanel = false;
			var clipName = evt.currentTarget.label;
			var clipName1 = evt.target;
			switch(clipName){ 
			case "Log In":
			if ((mc.user.text =="") || (mc.pass.text == "")){
			callError("Please Input \n User Name and \n Password");	
			}else{
			checkLogin(mc.user.text, mc.pass.text, clipName1);	
			}
			
			break;			
			}*/
			
		}
		
		private function checkLogin(dataObj:*, panel:ViewPanel):void{	
			nc.connect("http://www.forgegraphics.com/JHH/");
			trace("at least this ran");
			res = new Responder(onResult, onError);	
			nc.call("Logindb.getLogin", res);
			
			function onResult(e:Object):void{			
				var checkUser:String;
				var checkPass:String;
				var noUser:int = 0;
				
				var user:String = dataObj["username"]
				var pass:String = dataObj["password"];
				
				
				for(var i:int = 0; i < e.length; i++){		 
					checkUser = e[i].user;
					checkPass = e[i].password;
					
					
					if ((checkUser == user) && (checkPass == pass)){
						//if the query succeeds then an object is compiled and it will be handled by the panel
						panel.dataSuccess(dataObj);
						break;
					}else{					
						trace("incorrect user");	
						noUser++;
						if(noUser == e.length){
							panel.dataFail();
							trace("there were no users found")
							//callError("No Valid \n Users \n Found");	
						}
					}
				}
				nc.close();
			}
			
			function onError(e:Object):void{
				trace("Database Error");
				nc.close();	
			}		
		}

	}
}