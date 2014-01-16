package by.kross77.loaders 
{
import by.kross77.events.DownloadEvent;

import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.URLRequest;
import flash.system.LoaderContext;

/**
	 * класс расширяет базовый класс, увеличивая немного функционал, тем что в классе присутствует список (list) ссылок на файлы, которые последовательно загружается
	 * @link 2051020@gmail.com
	 * @author kross77
	 */
	public class MultiLoader extends Loader
	{
		//переменная содержит в себе список ссылок на загружаемые файлы
		protected var list:Array = new Array();
		//пользовательские функции, которые определяюстся пользователем
		private var _onComplete:Function = null;
		private var _onProgress:Function = null;
		//счетчик
		private var currentItem:Number = 0;
		//переменная, возвращающая значение того грузиться ли что-то или нет
		private var _loading:Boolean = false;
		
		//статические переменные, обозначающие события
		public static const DOWNLOADED:String = "downloaded";
		public static const M_LOAD_ALL_IMAGES:String = "loadAll";
		
		public function MultiLoader() 
		{
			super();
			contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressLoaderlistener);
			contentLoaderInfo.addEventListener(Event.COMPLETE, completeListener);
			contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorListener);
		}
		//вызывается при возникновении ошибок
		private function errorListener(e:IOErrorEvent):void 
		{
			trace(e.toString());
		}
		
		//дополняем базовую функцию, создаем событие загузки
		override public function load(request:URLRequest, context:LoaderContext = null):void 
		{
			_loading = true;
			super.load(request, context);
		}
		
		//вызывается при загрузке файла, пользовательской функции параметры
		private function progressLoaderlistener(e:ProgressEvent):void 
		{
			if(_onProgress != null) _onProgress(e);
		}
		
		//вызывается при завершении загрузки, проверяет есть ли в списке еще ссылки, если есть грузит следующий файл, иначе формирует событие завершения
		private function completeListener(e:Event):void 
		{
			if (_onComplete != null) _onComplete(e);
			if (currentItem < list.length-1) {
				currentItem++;
				load(new URLRequest(list[currentItem]));
				
			}else {
				dispatchEvent(new Event(DownloadEvent.DOWNLOAD));
				_loading  = false;
			}
		}
		//начинает загрузку, если список не пустой
		public function start():void
		{
			if(list.length>0) load(new URLRequest(list[currentItem]));
		}
		//присваивает значение пользовательсой функции которая вызывается при завершении загрузки одного файла
		public function set onComplete(value:Function):void 
		{
			_onComplete = value;
		}
		
		//присваивает значение пользовательсой функции которая вызывается при загрузке (progress) загрузки одного файла
		public function set onProgress(value:Function):void 
		{
			_onProgress = value;
		}
		
		//возвращает значение переменной _loading
		public function get loading():Boolean { return _loading; }
		
		//добаляет в список (list) ссылку
		public function push(url:String):void
		{
			list.push(url);
		}
		
		//принимает массив ссылок
		public function links(urls:Array):void
		{
			currentItem = 0;
			list = new Array();
			list = urls;
		}
	}

}