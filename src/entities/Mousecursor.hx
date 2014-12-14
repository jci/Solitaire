package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Graphic;
import com.haxepunk.utils.Input;
import com.haxepunk.masks.Hitbox;
import openfl.ui.Mouse;


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
		this.visible = true;
		this.layer = -1;
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



	}
}
