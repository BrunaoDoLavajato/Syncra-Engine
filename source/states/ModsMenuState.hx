package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.utils.Assets;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;

class ModsMenuState extends FlxState {
    override public function create():Void {
        super.create();

        // Background
        var bg = new FlxSprite().loadGraphic("assets/images/menus_assets/menuBGMagenta.png");
        add(bg);

        // Semi-transparent overlay
        var overlay = new FlxSprite();
        overlay.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        overlay.alpha = 0.2;
        add(overlay);

        // Gray box for icon background
        var grayBg = new FlxSprite(100, 100);
        grayBg.makeGraphic(170, 170, FlxColor.GRAY);
        add(grayBg);

        // Load mod info
        var modFolder = "mods/YourModFolder/";
        var infoPath = modFolder + "Mod-Info.json";

        if (!FileSystem.exists(infoPath)) {
            trace("Mod-Info.json not found.");
            return;
        }

        var infoRaw = File.getContent(infoPath);
        var modInfo:Dynamic = Json.parse(infoRaw);

        // Load Mod Icon
        var modIcon = new FlxSprite(110, 110);
        modIcon.loadGraphic(modFolder + "Mod-Icon.png");
        modIcon.setGraphicSize(150, 150);
        modIcon.updateHitbox();
        add(modIcon);

        // Display Mod Name
        var nameText = new FlxText(300, 120, 400, Std.string(modInfo.name));
        nameText.setFormat("assets/fonts/vcr.ttf", 24, FlxColor.WHITE);
        add(nameText);

        // Display Description
        var descriptionText = new FlxText(300, 160, 400, Std.string(modInfo.description));
        descriptionText.setFormat("assets/fonts/vcr.ttf", 16, FlxColor.LTGRAY);
        add(descriptionText);

        // Update mod list based on platform
        updateModList(Std.string(modInfo.name));
    }

    function updateModList(modName:String):Void {
        var isMobile = #if android true #else false #end;
        var modListPath = isMobile ? "/storage/emulated/0/.SRC ENGINE/modList.json" : "Syncra/mods/modList.json";

        var modList:Dynamic = {};
        if (FileSystem.exists(modListPath)) {
            try {
                modList = Json.parse(File.getContent(modListPath));
            } catch (e) {
                trace("Failed to parse modList.json, creating new one.");
            }
        }

        Reflect.setField(modList, "Mod 1", modName);
        File.saveContent(modListPath, Json.stringify(modList, null, "  "));
    }
}
