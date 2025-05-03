package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.MainMenuState;

class Main extends Sprite {
    public function new() {
        super();
        addChild(new FlxGame(1280, 730, MainMenuState, 1, 60, 60, true));
    }
}
