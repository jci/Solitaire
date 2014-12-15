package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Graphic;
import com.haxepunk.utils.Input;
import com.haxepunk.masks.Hitbox;
import openfl.ui.Mouse;
import scenes.MainScene;


class Mousecursor extends Entity
{
	var thisimage : Image;
	public var posx : Float;
	public var posy : Float;

	public override function new()
	{
		super();
		init();
	}

	private function init()
	{
		type = "mousecursor";
		thisimage = new Image("graphics/jci.png");
		thisimage.centerOrigin();
		setHitbox(1,1);
		addGraphic(thisimage);
		this.visible = false;
		this.layer = 4;

	}

	public override function update()
	{


		super.update();

#if desktop
		this.x = Input.mouseX;
		this.y = Input.mouseY;
#else

		this.x = Input.mouseFlashX;
		this.y = Input.mouseFlashY;
#end
		posx = this.x;
		posy = this.y;


/*
		var collision = collide("card", this.x,this.y);

		if (collision != null)
		{
			var cardtemp = cast(collision ,Card);

			if (Input.mousePressed && Input.mouseDown)
			{
				trace (["" + cardtemp.cardname + " " + cardtemp.type + " " + cardtemp.cardstate]);
				var selectedcard : Card = cardtemp;
				cardtemp.setSelected();
			}
		}
*/

	}



}
