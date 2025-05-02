package;

import flixel.FlxGame;
import states.InitState;

class Main extends FlxGame {
    public function new() {
        super(1280, 720, InitState); // Set resolution + initial state
    }

    public static function main():Void {
        new Main();
    }
}
