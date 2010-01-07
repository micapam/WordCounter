package com.almirun.apps.wordcounter.events
{
	import com.almirun.apps.wordcounter.model.Manuscript;
	
	import flash.events.Event;

	public class ManuscriptEvent extends Event
	{
		public static const MANUSCRIPT_UPDATE:String = "MANUSCRIPT_UPDATE";
		public static const MANUSCRIPT_DESTROY:String = "MANUSCRIPT_DESTROY";
		
		public function get manuscript():Manuscript
		{
			return _manuscript;
		}
		private var _manuscript:Manuscript;
		
		public function ManuscriptEvent(type:String, manuscript:Manuscript)
		{
			super(type, true);
			_manuscript = manuscript;
		}
	}
}