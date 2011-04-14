package controller
{
	import flash.events.Event;
	
	import view.ViewPanel;

	public interface IController
	{
		function createData():void;
		function readData(panel:Event,dataObj:*):void;
		function updateData():void;
		function deleteData():void;
		function recEvent(event:Event):void;
		function retEvent():Event;
		function get controller():IController;
	}
}