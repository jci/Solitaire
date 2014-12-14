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


/*

   TODO:

   - move the dragging code here instead of the card code
   - implement a scoring system 
   - implement an undo system (more than desirable)
   - replay code 



   */



class MainScene extends Scene
{

	private var deck : Array<Card>;

	private var _message : Sprite;
	public var _messagelog : TextField;
	public var mousecursor : Mousecursor;
	public var _dragging :Bool;



	public override function new()
	{

		var counter : Float;
		var cvalue : Int = 0;
		var ccolor : Int = 0;
		var _sprite : Sprite;


		super();
		_sprite = new Sprite();

		deck = new Array<Card>();


		for (counter in 0...52)
		{
			var thiscard : Card;
			thiscard = new Card(cvalue, ccolor, (cvalue*30+90), (ccolor*70+50));	
			this.add(thiscard);
			cvalue++;

			if (cvalue >12)
			{
				cvalue = 0;
				ccolor++;
			}
			
		}


		// add the rest of the shit of the screen

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


		mousecursor = new Mousecursor();
		mousecursor.layer = -1;
		mousecursor.visible = false;
		add(mousecursor);


	}

	public override function update()
	{
		super.update();
		_messagelog.text = mousecursor.posx  + " " + mousecursor.posy;
	}

}
