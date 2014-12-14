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
import com.haxepunk.Tween;
import com.haxepunk.Tweener;
import com.haxepunk.tweens.misc.NumTween;
import utils.CardFace;




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
	private var _cardface : Graphic;
	private var _cardcaret : Graphic;
	private var _cardutil : CardFace;
	private var _mouseover : Bool;
	private var _clickstarted : Bool;
	private var _dragging : Bool;
	private var _selection : Bool;
	private var _origx : Float;
	private var _origy : Float;
	private var _isSelected : Bool;
	private var _sizetween : NumTween;

	public var cardname : String;

	public override function new(cardvalue:Int = 0, cardtype : Int = 0, thisx : Float =0, thisy :Float = 0)	
	{

		var tempinstance = CardFace.getInstance();
		super();
	
		x = thisx;
		y = thisy;

		_draggable = true;
		_cardvalue	=	cardvalue;
		_cardtype 	=	cardtype;

		_stCard = doType(cardtype);

		layer = 4;
		cardname = (_cardvalue+1) + " of " + doType(_cardtype);
		
		addGraphic(tempinstance.loadCard(cardvalue,cardtype));
		setHitboxTo(tempinstance.getHitbox());

		_sizetween = new NumTween();
		_sizetween.tween(-30,30,8);

		addTween(_sizetween);	

		type = "card";



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

}
