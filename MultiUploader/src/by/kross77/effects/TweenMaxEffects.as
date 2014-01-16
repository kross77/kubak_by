package by.kross77.effects 
{

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;

import gs.*;

/**
	 * класс содержит в себе переходы, эффекты и создан для ускорения процесса написания кода
	 * 
	 * @author kross77
	 */
	public class TweenMaxEffects extends Object
	{
		//время выполнения эффекта при наведении покидании объекта
		private var _overOutDuration:Number = .4;
		
		///функция изменяет цвет переданного объекта
		public function tint(mc:DisplayObject, color:uint, time:Number):void
		{
			TweenLite.to(mc, time, { tint:color } );
		}
		///функция возврашает исходный цвет переданного объекта
		public function removeTint(mc:DisplayObject, time:Number):void
		{
			TweenLite.to(mc, time, { removeTint:true } );
		}
		
		///накладывает цвет методом colorMatrixFilter: colorize:
		public function colorize(mc:DisplayObject, color:uint, time:Number):void
		{
			TweenMax.to(mc, time, {colorMatrixFilter:{colorize:color}});
		}
		
		///возврашает исходный цвет переданного объекта
		public function unColorize(mc:DisplayObject, time:Number):void
		{
			TweenMax.to(mc, time, {colorMatrixFilter:{}});
		}
		
		///сжимает объект по координате x
		public function scaleX(mc:DisplayObject, _scaleX:Number, time:Number=.3):void
		{
			TweenMax.to(mc, time, { scaleX: _scaleX } );
		}
		///изменяет прозрачность объекта
		public function alphaTo(mc:DisplayObject, _alpha:Number, time:Number = .3):void
		{
			TweenMax.to(mc, time, { alpha: _alpha } );
		}
		///изменяет прозрачность, и если параметр равен нулю устанавливает свойство visible false и противоположно true если больше нуля прозрачность
		public function alphaVis(mc:DisplayObject, _alpha:Number, time:Number = .3, completeFunc:Function = null):void
		{
			if (_alpha > 0)
			{
				if (mc.visible == false) {
					mc.alpha = 0;
				}
				mc.visible = true;
				TweenMax.to(mc, time, { alpha: _alpha } );
			}
			else 
			{
				TweenMax.to(mc, time, { alpha: _alpha, onComplete: 
					function():void 
					{ 
						mc.visible = false;
						if(completeFunc != null) completeFunc();
					}
				} );
			}
			
		}
		///прозрачность сводит к нулю и удаляет клип из parentObj
		public function alphaRem(mc:DisplayObject, parentObj:MovieClip, time:Number = .3, _onComplete:Function = null):void
		{
			TweenMax.to(mc, time, { alpha: 0, onComplete: 
							function():void
							{
								parentObj.removeChild(mc);
								if (_onComplete != null) {
									_onComplete();
								}
							}
						});
		}
		
		
		
		///показывает объет
		public function show(e:MouseEvent):void
		{
			var mc:MovieClip = e.currentTarget as MovieClip;
			TweenLite.to(mc, _overOutDuration, { alpha: 1 } );
		}
		///скрывает объект
		public function hide(e:MouseEvent):void
		{
			var mc:MovieClip = e.currentTarget as MovieClip;
			TweenLite.to(mc, _overOutDuration, { alpha: 0 } );
		}
		
		///изменяет время выполнения эффекта
		public function set overOutDuration(value:Number):void 
		{
			_overOutDuration = value;
		}
		
		public function toY(mc:DisplayObject, _y:Number, time:Number = .3):void
		{
			TweenMax.to(mc, time, { y: _y } );
		}
		
		public function toX(mc:DisplayObject, _x:Number, time:Number = .3):void
		{
			TweenMax.to(mc, time, { x: _x } );
		}
	}

}