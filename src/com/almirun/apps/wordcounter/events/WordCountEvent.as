package com.almirun.apps.wordcounter.events
{
	import com.almirun.apps.wordcounter.model.Manuscript;
	import com.almirun.apps.wordcounter.model.WordCount;
	
	import flash.events.Event;
	
	public class WordCountEvent extends Event
	{
		public static const WORD_COUNT_UPDATE:String = "WORD_COUNT_UPDATE";
				
		public function get manuscript():Manuscript { return _manuscript; }
		private var _manuscript:Manuscript;
		
		public function get wordCount():WordCount { return _wordCount; }
		private var _wordCount:WordCount;
		
		public function WordCountEvent(type:String, manuscript:Manuscript, 
				wordCount:WordCount)
		{
			super(type, true); 
			_manuscript = manuscript;
			_wordCount = wordCount;
		}
	}
}