package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import sys.io.File;
import haxe.Json;

class PlayState extends FlxState {
	var stage:FlxSprite;
	var player:FlxSprite;
	var opponent:FlxSprite;
	var songName:String = "test-song"; // Default for now

	override public function create():Void {
		super.create();

		FlxG.camera.bgColor = FlxColor.BLACK;

		loadStage();
		loadCharacters();

		var songInfoText = new FlxText(10, 10, 0, 'Now Playing: $songName', 16);
		songInfoText.setFormat("assets/fonts/vcr.ttf", 16, FlxColor.WHITE);
		add(songInfoText);
	}

	function loadStage():Void {
		stage = new FlxSprite(0, 0, ".SRC ENGINE/assets/images/stages/stageBG.png");
		add(stage);
	}

	function loadCharacters():Void {
		player = new FlxSprite(300, 300, ".SRC ENGINE/assets/characters/bf.png");
		opponent = new FlxSprite(100, 300, ".SRC ENGINE/assets/characters/dad.png");

		add(opponent);
		add(player);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE) {
			FlxG.switchState(new MainMenuState());
		}
	}
}
