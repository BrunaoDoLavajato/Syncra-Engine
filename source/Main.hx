package;

import states.InitState;
import flixel.FlxGame;

class Main extends FlxGame {
    public function new() {
        super(1280, 720, InitState); // Your InitState class
    }

    public static function main():Void {
        new Main();
    }
}
