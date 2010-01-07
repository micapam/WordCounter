package com.almirun.apps.wordcounter.model
{
	[Bindable]
	[Table(name="word_count")]
	public class WordCount
	{
		[Id]
		public var id:int;
		
		[Column(name="count_date")]
		public var countDate:Date;
		
		[Column(name="is_goal")]
		public var isGoal:Boolean;
		
		[Column(name="num_words")]
		public var numWords:int;
	}
}