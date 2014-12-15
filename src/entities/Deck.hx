package entities;

import entities.Card;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import openfl.events.Event;

class Deck
{

	public var deck : Array<Card>;

	public function new()
	{
		deck = new Array<Card>();
		init();
	}

	public function init()
	{

		var counter : Int = 0;		
		var cvalue : Int = 0;
		var ccolor : Int = 0;

		for (counter in 0...52)
		{
			var thiscard : Card;
			thiscard = new Card(cvalue, ccolor);	
			thiscard.visible = true;


			thiscard.x = -1000;
			thiscard.y = -1000;

			cvalue++;

			if (cvalue >12)
			{
				cvalue = 0;
				ccolor++;
			}

			deck.push(thiscard);
		}

	}

	public function addtoScene(scene : Scene)
	{
		var i : Int;

		for (i in 0...length())
		{
			deck[i].x=100+i*20;
			deck[i].y=100;

			if (deck[1].scene == scene)
			{
				scene.remove(deck[i]);
				// to prevent duplication...
			}
			scene.add(deck[i]);
		}


	}

	private function length()
	{
		return deck.length;
	}

	public function shuffle()
	{		
		var _length:Int= deck.length;
		var mixed:Array<Card>= deck.slice(0,_length);
		var rn:Int;
		var it:Int;
		var el:Card;

		for (i in 0...deck.length)
		{
			el = mixed[i];
			rn = Math.floor(Math.random() * _length);
			mixed[i] = mixed[rn];
			mixed[rn] = el;
		}

		deck = mixed;

	}

	public function reshuffle(scene : Scene)
	{
		shuffle();
		addtoScene(scene);
	}


	
}
