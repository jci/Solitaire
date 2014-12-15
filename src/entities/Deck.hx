package entities;

import entities.Card;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import openfl.events.Event;

class Deck
{

	public var deck : Array<Card>;
	public var playground : Array<Array<Card>>;
	public var foundation : Array<Array<Card>>;

	// YO DAWG I HEARD YOU LIKE DECKS
	// SO I PUT A DECK IN YOUR DECK WHILE YOU DECK

	private var _topdeck : Int;

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

		_topdeck = 0;

		foundation = new Array<Array<Card>>();

		foundation[0] = new Array<Card>(); // clubs
		foundation[1] = new Array<Card>(); // hearts
		foundation[2] = new Array<Card>(); // spades
		foundation[3] = new Array<Card>(); // diamonds

		playground = new Array<Array<Card>>();

		playground[0] = new Array<Card>();
		playground[1] = new Array<Card>();
		playground[2] = new Array<Card>();
		playground[3] = new Array<Card>();
		playground[4] = new Array<Card>();
		playground[5] = new Array<Card>();
		playground[6] = new Array<Card>();

		

	}

	public function addtoScene(scene : Scene)
	{
		var i : Int;

		for (i in 0...length())
		{
			deck[i].x=50;
			deck[i].y=100;

			if (deck[1].scene == scene)
			{
				scene.remove(deck[i]);
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

	public function deal()
	{
		shuffle();
	
		var col=1;
		// now the rules
		// first, the cards that go on game
		for (columns in 0...7)
		{
			// pick up card from deck and move it to playground
			// top is always 0
			for (cards in 0...col)
			{
				//trace(["" + cards + " " + columns + " " + col]);
				playcard(col);
			}

			col++;

		}

		renderCards();

	}

	public function playcard(col : Int = 0)
	{
		deck[_topdeck].cardstate = INGAME;
		deck[_topdeck].column = col;
		_topdeck++;
	}

	private function renderCards()
	{

		// for fucks sake, I need to see now to do this properly
		//

		var col1=0;
		var count=0;

		for (i in 0...deck.length)
		{
			var mycard : Card = deck[i];

			if (mycard.cardstate == INGAME)
			{

				var posx = mycard.column * 80 + 10; // hardcoded!
				mycard.x = posx;
				mycard.y = 300+count*20;

				if (mycard.column == (count+1))
				{
					// is this the last card?
					mycard.doFlip();
					count = 0;
				}
				else
				{
					mycard.cardstate = INGAMEDISABLED;
					count++;
				}

				playground[mycard.column -1 ].push(mycard);

			}

			if (mycard.cardstate == DECK)
			{
				mycard.x = 50;
				mycard.y = 100;
			}
		}

		column1();

	}

	private function column1(column : Int=1)
	{	

		for (i in 0...7)
		{
			for (j in 0...playground[i].length)
			{
				trace([playground[i][j].cardname]);
			}
		}
	}

}
