package trh.helpers
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;

	public class DictionaryTest extends Sprite
	{
		
		private const TOP:String = "TOP";
		private const RIGHT:String = "RIGHT";
		private const BOTTOM:String = "BOTTOM";
		private const LEFT:String = "LEFT";
		
		//simply clickable entities
		private var buttonTop:SimpleButton = randomButton();
		private var buttonRight:SimpleButton = randomButton();
		private var buttonBottom:SimpleButton = randomButton();
		private var buttonLeft:SimpleButton = randomButton();
		
		private var ball:Shape = new Shape();
		
		//dictionary key/value pairs
		private var buttons:Dictionary = new Dictionary();
		
		public function DictionaryTest()
		{
			initButton(buttonTop, TOP);
			initButton(buttonRight, RIGHT);
			initButton(buttonBottom, BOTTOM);
			initButton(buttonLeft, LEFT);
			initView();
		}
		
			
		
		private function initView():void
		{
			var buttonsClip:Sprite = new Sprite();
			var ball:Shape = randomBall();
			addChild(buttonsClip);
			addChild(ball);
			for (var button:* in buttons)
			{
				button.x = buttonsClip.numChildren*(button.width+5);
				buttonsClip.addChild(button);
			}
			//listening to the cotnainer clip instead of each individual instance
			buttonsClip.addEventListener(MouseEvent.CLICK, onButtonClick, true);
		}
		
		private function randomBall():Shape
		{
			with (ball)
			{
				graphics.beginFill(randomNumber() * 0xFFFFFF);
				graphics.drawCircle(0, 0, randomNumber() * 25);
				graphics.endFill();
			}
			ball.x = randomNumber() * stage.stageWidth;
			ball.y = randomNumber() * stage.stageHeight;
			
			return ball;
		}
		
		private function randomButton():SimpleButton
		{
			return new SimpleButton(buttonState(), buttonState(), buttonState(), buttonState());
		}
		
		private function buttonState():Sprite
		{
			var state:Sprite = new Sprite();
			with (state)
			{
				graphics.beginFill(randomNumber() * 0xFFFFFF);
				graphics.drawRect(0, 0, 33, 22);
				graphics.endFill();
			}
			return state;
		}
		
		private function initButton(button:SimpleButton, direction:String):void
		{
			//dynamically creating the collection
			buttons[button] = direction;
		}
		
		private function onButtonClick(event:MouseEvent):void
		{
			if (event.target is SimpleButton)
				moveObject(buttons[event.target]);
		}
		
		private function moveObject(direction:String):void
		{
			trace("moveObject: " + direction);
			
			var amount:uint = 5;
			
			switch (direction)
			{
				case TOP:
					ball.y -= amount;
					break;
				case RIGHT:
					ball.x += amount;
					break;
				case BOTTOM:
					ball.y += amount;
					break;
				case LEFT:
					ball.x -= amount;
					break;
			}
		}
		
		private function randomNumber():Number
		{
			return Math.random();
		}
		
		
	}
}