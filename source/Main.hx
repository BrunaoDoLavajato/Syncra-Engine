package;

import openfl.display.Sprite;
import flixel.FlxGame;
import states.MainMenuState;

@:keep
class Main extends Sprite {
    public function new() {
        super();
        // width, height, initial state
        addChild(new FlxGame(1280, 720, MainMenuState));
    }
}
