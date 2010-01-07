package com.almirun.apps.wordcounter.model
{
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.collections.ListCollectionView;
	
	[Bindable]
	[Table(name="manuscript")]
	public class Manuscript
	{
		[Id]
		public var id:int;
		
		[Transient]
		public function get goals():ICollectionView
		{
			if (null == _goals)
			{
				_goals = new ListCollectionView(wordCounts);
				_goals.filterFunction = function(item:Object):Boolean
				{ 
					return item is WordCount && (item as WordCount).isGoal; 
				};
			}
			
			return _goals;
		}
		private var _goals:ListCollectionView;
		
		[Transient]
		public function get tallies():ICollectionView
		{
			if (null == _tallies)
			{
				_tallies = new ListCollectionView(wordCounts);
				_tallies.filterFunction = function(item:Object):Boolean
				{ 
					return item is WordCount && !(item as WordCount).isGoal; 
				};
			}
			
			return _tallies;
		}
		private var _tallies:ListCollectionView;
		
		[Column(name="title")]
		public var title:String;
		
		[Column(name="start_date")]
		public var startDate:Date;
		
		[OneToMany(type="com.almirun.apps.wordcounter.model.WordCount",
			lazy="false", cascade="all")]
		public var wordCounts:ArrayCollection = new ArrayCollection();
		
 
	}
}