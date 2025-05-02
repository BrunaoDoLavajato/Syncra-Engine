package;

import flixel.FlxGame;
import states.InitState;

class Main extends FlxGame {
	public function new() {
		super(1280, 720, InitState); // Set your preferred resolution and initial state
	}
}
