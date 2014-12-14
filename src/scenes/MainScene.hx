package scenes;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import flash.text.TextField;
import flash.display.Sprite;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import com.haxepunk.utils.Input;
import entities.Card;
import entities.Mousecursor;
import entities.Deck;

/*

   TODO:

   - move the dragging code here instead of the card code
   - implement a scoring system 
   - implement an undo system (more than desirable)
   - replay code 



   */



class MainScene extends Scene
{


	private var _message : Sprite;
	public var _messagelog : TextField;
	public var mousecursor : Mousecursor;
	public var _dragging :Bool;


	public var _cardtableX = HXP.width;
	public var _cardtableY = HXP.height;
	public var deck : Deck;


	public override function new()
	{

		var counter : Float;
		var cvalue : Int = 0;
		var ccolor : Int = 0;
		var _sprite : Sprite;


		super();
		_sprite = new Sprite();

		deck = new Deck();

		_message  = new Sprite();
		_messagelog = new TextField();
		_message.addChild(_messagelog);
		_messagelog.x = 0;
		_messagelog.y = 10;
		_messagelog.defaultTextFormat.size = 16;
		_messagelog.defaultTextFormat.color = 0x101010;
		_messagelog.defaultTextFormat.align = TextFormatAlign.LEFT;
		_messagelog.text = "THIS IS SPARTAAA";
		_sprite.addChild(_message);
		HXP.stage.addChild(_sprite);

		// mousecursor

		add(new Mousecursor());


	}

	public override function update()
	{
		super.update();
		_messagelog.text = mousecursor.posx  + " " + mousecursor.posy;
	}

}
