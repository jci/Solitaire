package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.Graphic;
import flash.display.Graphics;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.*;
import com.haxepunk.Mask;
import com.haxepunk.masks.Hitbox;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;
import openfl.events.Event;
import com.haxepunk.utils.Draw;
import utils.CardFace;


/*

   TODO:
   - remove the dragging code from here and implement it on the scene code
   - create a much much better click detection system


   */



class Card extends Entity
{

	// position 
	private var _thisx : Float; // horiz
	private var _thisy : Float; // vert
	private var _draggable : Bool;
	private var _cardparent : Card;
	private var _isFlipped : Bool;
	private var _isVisible : Bool;
	private var _stCard : String;
	private var _cardvalue : Int; // card value 0-12
	private var _cardtype : Int; // card type 0-3
	private var _cardface : Graphic; // card graphics
	private var _cardcaret : Graphic;
	private var _cardutil : CardFace;
	private var _mouseover : Bool;
	private var _clickstarted : Bool;
	private var _dragging : Bool;
	private var _selection : Bool;
	private var _origx : Float;
	private var _origy : Float;

	public override function new(cardvalue:Int = 0, cardtype : Int = 0, thisx : Float =0, thisy :Float = 0)	
	{

		var tempinstance = CardFace.getInstance();
		super();
	
		x = thisx;
		y = thisy;

		_draggable = true;
			
		_cardvalue	=	cardvalue;
		_cardtype 	=	cardtype;


		_isVisible 	=	false;
		_isFlipped	=	false;
		_draggable	=	false;

		_stCard = doType(cardtype);

		layer = cardtype*4+1;
		type = _cardvalue + " of " + doType(_cardtype);
		
		addGraphic(tempinstance.loadCard(cardvalue,cardtype));
		setHitboxTo(tempinstance.getHitbox());

	}


	private function doType(cardtype:Int)
	{
		switch (cardtype)
		{
			case 0:
				return "Clubs";
			case 1:
				return "Spades";
			case 2:
				return "Diamonds";
			case 3:
				return "Hearts";
			default:
				return "WAT";
		}

		return null;
	}


	public function selectedCard()
	{
		var setselected :Bool = true;
		//then?

	}
}
