import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Joystick;
import scenes.MainScene;
import com.haxepunk.HXP;
import com.haxepunk.RenderMode;


class Main extends Engine
{

	private var myvar : Bool;
	private var gameState : Bool;

	override public function init()
	{
		// screen
		HXP.console.enable();
		HXP.scene = new MainScene();
	}

#if html5 
	override public function new(width:Int=0, height:Int=0, frameRate:Float=60, fixed:Bool=false, ?renderMode:RenderMode) {
//        super(720,480, frameRate, fixed, RenderMode.HARDWARE);
        super(width, height, frameRate, fixed, RenderMode.HARDWARE);
    }
#elseif flash
	override public function new(width:Int=0, height:Int=0, frameRate:Float=60, fixed:Bool=false, ?renderMode:RenderMode) {
//        super(720,480, frameRate, fixed, RenderMode.HARDWARE);
        super(width, height, frameRate, fixed, RenderMode.BUFFER);
    }

#elseif html5
	override public function new(width:Int=0, height:Int=0, frameRate:Float=60, fixed:Bool=false, ?renderMode:RenderMode) {
//        super(720,480, frameRate, fixed, RenderMode.HARDWARE);
        super(width, height, frameRate, fixed, RenderMode.BUFFER);
    }
#end



	public static function main() { new Main(); }

}
