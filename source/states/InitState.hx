package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class InitState extends FlxState {
	override public function create():Void {
		super.create();

		var basePath:String = "/storage/emulated/0/.SRC ENGINE/";
		var assetsPath = basePath + "assets/";
		var modsPath = basePath + "mods/";
		var logsPath = basePath + "logs/";
		var modListPath = basePath + "modList.json";

		createFolder(assetsPath);
		createFolder(modsPath);
		createFolder(logsPath);

		if (!FileSystem.exists(modListPath)) {
			var defaultModList = {
				"Mod 1": "Example Mod"
			};
			File.saveContent(modListPath, Json.stringify(defaultModList, "\t"));
			trace("Created modList.json");
		}

		// After setting everything, go to Main Menu
		FlxG.switchState(new MainMenuState());
	}

	private function createFolder(path:String):Void {
		if (!FileSystem.exists(path)) {
			FileSystem.createDirectory(path);
			trace('Created directory: $path');
		}
	}
}
