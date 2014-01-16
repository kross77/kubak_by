package 
{

	//[SWF( backgroundColor='0xFFFFFF', quality="high", frameRate='30', width='600', height='400')]


	
	import flash.display.*;
	
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	


	public class Main extends Sprite
	{
		private var m_curr_real_trace_y:Number;		// ïîçèöèÿ òåêóùåãî RealTrace ïî y

		function Main()
		{			
		
			m_curr_real_trace_y = 0;
		}
		 //--------------------------------------------------------------------------------------------------------		 
		// ф-я показывает текст на сцене
		public function RealTrace(trace_str:String):void
		{
			if(m_curr_real_trace_y>500) return;
			var trace_text:TextField = new TextField();
			addChild(trace_text);
			
			trace_text.border = true;			
			trace_text.htmlText = trace_str;
						
			trace_text.autoSize = "left";
			trace_text.background = true;
			trace_text.backgroundColor = 0xFFFFFF;		
			trace_text.y = m_curr_real_trace_y;
			m_curr_real_trace_y += 20;
		}
		//--------------------------------------------------------------------------------------------------------		 
		
		private function dataSize(bytes:Number):String
		{
			var kbString = "kB";
			var mbString = "MB";
			
			if (bytes >= 0)
			{
			}// end if
			if (bytes < 1024 * 1024)
			{
				return Math.ceil(bytes / 1024) + " " + kbString;
			}// end if
			//return this.format(bytes / 1024 / 1024, 1, ",") + " " + global.mbString;
			return this.format(bytes / 1024 / 1024, 1, ".") + " " + mbString;
		}




		
	}

}