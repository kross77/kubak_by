package 
{
import flash.display.*;
import flash.text.TextField;

/**
	 * ...
	 * @author kross77
	 * @link 2051020@gmail.com
	 */
	public class RealTrace extends Sprite
	{
		
		private var m_curr_real_trace_y:Number;
		
		public function RealTrace() 
		{
			m_curr_real_trace_y = 0;
			
		}
		
		// ф-я показывает текст на сцене
		public function Trace(trace_str:String):void
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
		
	}

}