package
{
	import com.junkbyte.console.Cc;
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	
	/**
	 * author 刘峰 vincent
	 * 创建时间：2014-4-2 下午8:11:16
	 */
	public class FlashConsole extends Sprite
	{
		public function FlashConsole()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			
			addEventListener("allComplete", allComplete);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function allComplete(event:Event):void
		{
			removeEventListener("allComplete", allComplete);
			var info:LoaderInfo = LoaderInfo(event.target);
			startup(info.content);
		}

		public static function startup(root:DisplayObject, x:Number=300, y:Number=300, width:Number=700, height:Number=300):void
		{
			Cc.startOnStage(root, "`"); // 按"*"调出控制台 再按则关闭
			Cc.commandLine = true;
			Cc.config.commandLineAllowed = true;
			Cc.width = width;
			Cc.height = height;
			Cc.x = x;
			Cc.y = y; 
			
			Cc.displayRoller = true;
			Cc.setRollerCaptureKey("c");
		}
	}
}