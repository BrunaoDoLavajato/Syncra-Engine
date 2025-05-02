package;

import openfl.display.Sprite;
import flixel.FlxGame;
import states.MainMenuState;

class Main extends Sprite {
    public function new() {
        super();
        addChild(new FlxGame(1280, 720, MainMenuState, 1, 60, 60, true));
    }
}
