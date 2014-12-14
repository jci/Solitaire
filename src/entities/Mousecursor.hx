package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Graphic;
import com.haxepunk.utils.Input;
import com.haxepunk.masks.Hitbox;


class Mousecursor extends Entity
{
	var thisimage : Image;
	public var posx : Float;
	public var posy : Float;

	public override function new()
	{
		super();
		this.type = "mousecursor";
		thisimage = new Image("graphics/jci.png");
		thisimage.centerOrigin();
		this.setHitbox(1,1);
		addGraphic(thisimage);
	}

	public override function update()
	{
		super.update();


		this.x = Input.mouseX;
		this.y = Input.mouseY;

		posx = this.x;
		posy = this.y;



	}
}
