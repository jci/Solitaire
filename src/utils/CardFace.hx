package utils;

import com.haxepunk.Graphic;
import com.haxepunk.HXP;
import com.haxepunk.Screen;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.atlas.Atlas;
import com.haxepunk.graphics.atlas.TextureAtlas;
import com.haxepunk.graphics.atlas.AtlasData;
import com.haxepunk.graphics.atlas.AtlasRegion;
import com.haxepunk.graphics.atlas.TileAtlas;
import com.haxepunk.masks.Hitbox;

import entities.Card;

class CardFace
{
	public static var _instance : CardFace;
	public static var graphic : Graphic;
	public static var cardatlas : TextureAtlas;
	public static var tile : TileAtlas;
	public static var myregion : AtlasRegion;


	public function new()
	{
		graphic = null;
		cardatlas = null;

		tile = new TileAtlas("graphics/cards.png");
		tile.prepare(68,96);



	}

	public static function getInstance () : CardFace
	{

		if (CardFace._instance == null)
		{
			CardFace._instance = new CardFace();
		}

		return CardFace._instance;
	}

	public function loadCard(cardvalue,cardtype)
	{
		myregion = tile.getRegion(cardvalue + cardtype*13);
		var imgcard :Image = new Image(myregion);
		imgcard.centerOrigin();
		return imgcard;
	}

	public function getHitbox()
	{
		// get the dimensions
		var newhitbox : Hitbox = new Hitbox(67,95,-32,-45);
		return newhitbox;
	}

	public function loadCaret()
	{
		var caretface = new Image("graphics/flipped.png");
		caretface.centerOrigin();
		return caretface;
	}

}

