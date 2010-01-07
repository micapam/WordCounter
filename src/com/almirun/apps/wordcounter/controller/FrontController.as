package com.almirun.apps.wordcounter.controller
{
	import com.almirun.apps.wordcounter.data.Binder;
	import com.almirun.apps.wordcounter.events.ManuscriptEvent;
	
	import flash.events.IEventDispatcher;
	
	import nz.co.codec.flexorm.EntityManager;
	
	public class FrontController
	{
		private var binder:Binder;
		private var em:EntityManager;
		
		public function FrontController(dispatcher:IEventDispatcher,
				entityManager:EntityManager, binder:Binder)
		{
			this.binder = binder;
			em = entityManager;
			
			dispatcher.addEventListener(ManuscriptEvent.MANUSCRIPT_UPDATE,
				handleManuscriptUpdateRequest);
			dispatcher.addEventListener(ManuscriptEvent.MANUSCRIPT_DESTROY,
				handleManuscriptDestroyRequest);
		}
		
		private function handleManuscriptUpdateRequest(
				event:ManuscriptEvent):void
		{
			em.save(event.manuscript);
			binder.reload();
		}
		
		private function handleManuscriptDestroyRequest(
				event:ManuscriptEvent):void
		{
			em.remove(event.manuscript);
			binder.reload();
		}
	}
}