package states;

import flixel.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.Assets;
import haxe.Json;
import sys.io.File;
import utils.FlxGridOverlay;

class ModsMenuState extends FlxState {
    override public function create():Void {
        super.create();

        // Background
        var bg = new FlxSprite().loadGraphic("assets/images/menus_assets/menuBGMagenta.png");
        add(bg);

        // Checkerboard overlay
        var checkerboard = FlxGridOverlay.create(40, 40, FlxG.width, FlxG.height);
        for (sprite in checkerboard.members) {
    if (sprite != null) sprite.alpha = 0.2;
        }
        add(checkerboard);
        

        // Gray background behind icon
        var grayBg = new FlxSprite(100, 100);
        grayBg.makeGraphic(170, 170, FlxColor.GRAY);
        add(grayBg);

        // Load Mod Info
        var modFolder = "mods/YourModFolder/"; // You may iterate mods later
        var infoPath = modFolder + "Mod-Info.json";

        if (!FileSystem.exists(infoPath)) {
            trace("Mod-Info.json not found.");
            return;
        }

        var infoRaw = File.getContent(infoPath);
        var modInfo:Dynamic = Json.parse(infoRaw);

        // Load Mod Icon
        var modIcon = new FlxSprite(110, 110).loadGraphic(modFolder + "Mod-Icon.png");
        modIcon.setGraphicSize(150, 150);
        modIcon.updateHitbox();
        add(modIcon);

        // Load and display Mod Name (with alphabet.png)
        var nameText = new FlxTypedGroup<FlxSprite>();
        var name:String = Std.string(modInfo.name);
        var xStart = 300;
        for (i in 0...name.length) {
            var letter = name.charAt(i).toLowerCase();
            if (letter == " ") continue;
            var charSprite = new FlxSprite(xStart + i * 30);
            charSprite.frames = FlxAtlasFrames.fromSparrow("assets/images/alphabet.png", "assets/images/alphabet.xml");
            charSprite.animation.addByPrefix("idle", letter, 24, false);
            charSprite.animation.play("idle");
            charSprite.y = 120;
            nameText.add(charSprite);
        }
        add(nameText);

        // Load and display description
        var descriptionText = new FlxText(300, 170, 400, Std.string(modInfo.description));
        descriptionText.setFormat("assets/fonts/vcr.ttf", 16, FlxColor.WHITE, FlxTextAlign.LEFT);
        add(descriptionText);

        // Update modList.json based on platform
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

        // Add mod to list
        var modList:Dynamic = {};
Reflect.setField(modList, "Mod 1", modName);
        

        File.saveContent(modListPath, Json.stringify(modList, null, "  "));
    }
}
