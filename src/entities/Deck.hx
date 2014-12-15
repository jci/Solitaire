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
		foundation[1] = new Array<Card>(); // spades
		foundation[2] = new Array<Card>(); // diamonds
		foundation[3] = new Array<Card>(); // hearts

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

		// move the corresponding cards to the respective places...

		for (playc in 0...4)
		{
			var tempcard = new Card();
			tempcard = deck.pop();
			tempcard.cardstate = INGAME;
		//	trace(["" + tempcard.cardname + " being popped and put into playground"]);
			playground[0].push(tempcard);
		}

		// this function has been implemented for pure implementation testing
		// before delivering everything, take this piece of shit outta my sight!

		for (foundat in 0...130)
		{
			var tempcard = new Card();
			tempcard = deck.pop();
		//	trace(["Testing to push onto foundation " + tempcard.cardname]);
			if (!moveFoundation(tempcard)) 
			{
				deck.push(tempcard); // put it back, you maniac!
				shuffle();
			}


		}

		printFoundation();

		for (ldeck in 0...deck.length)
		{
			deck[ldeck].cardstate = DECK;
		}



	}


	public function renderCards()
	{

		// render the deck array
		// then the playground array
		// then the foundation array

		// let's render the foundation first

		trace(["Render DECK has " + deck.length + " cards"]);

	}

	public function moveFoundation(card : Card)
	{

		// now the implementation of the rules

		// rule 1 : you do not talk about the fight club
		// rule 2 : you cannot put any card onto a blank foundation, only aces
		// rule 3 : if the foundation is not null, check if the value of the last card is 1 of difference from the compared one
		// rule 4 : ???

		var thisfound = card.returnType();
		// check the foundation

		var amount = foundation[thisfound].length;
		if ( amount == 0 && card.returnValue()==0) // it's an ace!
		{
			card.cardstate = FOUNDATION;
			foundation[thisfound].push(card);
			trace(["Foundation added : " + card.cardname]);
			return true;
		}

		if (amount >0)
		{
			var lastlen = foundation[thisfound].length-1; //meaning, the last element
			//trace(["Amount " + amount + " Lastlen " + lastlen + " on foundation " + card.returnType() ]);
			var comparecard = foundation[thisfound][lastlen];
			var comparecardvalue = comparecard.returnValue()+1;
			if (comparecardvalue == card.returnValue())
			{
				card.cardstate = FOUNDATION;
				foundation[thisfound].push(card);
				trace(["Foundation added : " + card.cardname]);
				return true;
			}
		}

		return false;

	}


	private function printFoundation()
	{
		// print all the foundations

		for (i in 0...4)
		{
			var mydeck = new Array<Card>();

			mydeck = foundation[i];

			for (j in 0...mydeck.length)
			{
				trace(["" + "Foundation " + i +  "," + j + " has " + foundation[i][j].cardname]);
			}
			

		}
	}

	function renderFoundation()
	{
	}

	function renderPlayground()
	{
	}

	function renderDeck()
	{
	}

}
