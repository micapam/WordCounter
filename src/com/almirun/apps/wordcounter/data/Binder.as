package com.almirun.apps.wordcounter.data
{
	import com.almirun.apps.wordcounter.model.Manuscript;
	
	import mx.collections.ArrayCollection;
	
	import nz.co.codec.flexorm.EntityManager;
	
	public class Binder
	{
		public function get entityManager():EntityManager
			{ return _entityManager; }
		public function set entityManager(value:EntityManager):void
			{ _entityManager = value; }
		private var _entityManager:EntityManager;
		
		[Bindable]
		public function get manuscripts():ArrayCollection
			{ return _manuscripts; }
		public function set manuscripts(value:ArrayCollection):void 
			{ _manuscripts = value; }
		private var _manuscripts:ArrayCollection;
		
		public function Binder()
		{
			manuscripts = new ArrayCollection();
		}

		public function reload():void
		{
			var ms:ArrayCollection = entityManager.findAll(Manuscript);
			manuscripts.source = ms.source;
			manuscripts.refresh();
		}
	}
}