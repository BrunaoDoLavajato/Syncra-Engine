package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.MainMenuState;

class Main extends Sprite {
    public function new() {
        super();
        // Corrected: last 3 args are frameRate, skipSplash (Bool), and startPaused (Bool)
        addChild(new FlxGame(1280, 720, MainMenuState, 60, 60, true));
    }
}
