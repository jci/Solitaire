package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.*;
import com.haxepunk.Mask;
import com.haxepunk.masks.Hitbox;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;
import openfl.events.Event;
import com.haxepunk.utils.Draw;
import com.haxepunk.Tween;
import com.haxepunk.Tweener;
import com.haxepunk.tweens.misc.NumTween;
import flash.geom.Rectangle;
import flash.display.Sprite;
import utils.CardFace;
import com.haxepunk.graphics.Canvas;

enum CARDSTATE
{
	IDLE;
	INGAMEDISABLED;
	INGAME;
	INGAMEFLIPPED;
	DECK;
	FOUNDATION;

}

enum FOUNDATION
{
	CLUBS;
	HEARTS;
	SPADES;
	DIAMONDS;
}



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
	private var _cardvalue : Int; 
	private var _cardtype : Int; 
	private var _cardutil : CardFace;
	private var _cardface : Graphic;
	private var _cardcaret : Graphic;

	private var _mouseover : Bool;
	private var _clickstarted : Bool;
	private var _dragging : Bool;
	private var _selection : Bool;
	private var _origx : Float;
	private var _origy : Float;
	private var _isSelected : Bool;
	private var _sizetween : NumTween;
	private var _entrect : Rectangle;

	public var cardname : String;
	private var _canvas : Canvas;
	public var tempgr : Image;
	public var column : Int;

	public var cardstate : CARDSTATE;

	public override function new(cardvalue:Int = 0, cardtype : Int = 0, thisx : Float =0, thisy :Float = 0)	
	{

		super();

		var tempinstance = CardFace.getInstance();
		x = thisx;
		y = thisy;
		type = "card";

		_draggable = true;
		_cardvalue	=	cardvalue;
		_cardtype 	=	cardtype;

		_stCard = doType(cardtype);

		layer = 4;
		cardname = (_cardvalue+1) + " of " + doType(_cardtype);
		
//		addGraphic(tempinstance.loadCard(cardvalue,cardtype));
		_cardface = tempinstance.loadCard(cardvalue,cardtype);
		_cardcaret = tempinstance.loadCaret();


		addGraphic(_cardcaret);
		addGraphic(_cardface);

		_cardface.visible = false;
		_cardcaret.visible = true;

		setHitboxTo(tempinstance.getHitbox());

		_sizetween = new NumTween();
		_sizetween.tween(-30,30,8);

		addTween(_sizetween);	

		tempgr = new Image("graphics/jci2.png");
		tempgr.visible = false;

		// all cards start on the deck

		cardstate = DECK;
		column = 0;

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


	public override function update()
	{

		super.update();

	}

	public function isFacingDown()
	{
		return !_isFlipped;
	}


	public function setSelected()
	{
		_isSelected = !_isSelected;
	}

	public function doFlip()
	{
		if (cardstate == INGAMEDISABLED) return;	// don't flip cards that don't need to 

		_isFlipped = !_isFlipped;

		if (_isFlipped)
		{
			_cardface.visible = true;
			_cardcaret.visible = false;
		}
		else
		{
			_cardface.visible = false;
			_cardcaret.visible = true;
		}

	}

	public function moveFoundation()
	{
		cardstate = FOUNDATION;
	}

	public function returnValue()
	{
		return _cardvalue;
	}

	public function returnType()
	{
		return _cardtype;
	}


}
