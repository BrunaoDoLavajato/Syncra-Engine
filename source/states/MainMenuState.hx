package states;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import states.ModsMenuStateState;

class MainMenuState extends FlxState {
    var bg:FlxSprite;
    var menuOptions:Array<String> = ["story", "freeplay", "credits", "options"];
    var optionSprites:Array<FlxSprite> = [];
    var curSelected:Int = 0;

    override public function create():Void {
        super.create();

        bg = new FlxSprite(0, 0).loadGraphic("assets/images/menus_assets/menuBG.png");
        add(bg);

        for (i in 0...menuOptions.length) {
            var name = menuOptions[i];
            var spr = new FlxSprite();
            spr.frames = FlxAtlasFrames.fromSparrow(
                'assets/images/menus_assets/mainmenu/${name}.png',
                'assets/images/menus_assets/mainmenu/${name}.xml'
            );

            spr.animation.addByPrefix("idle", '${name} idle', 24, false);
            spr.animation.addByPrefix("select", '${name} select', 24, false);
            spr.animation.play("idle");

            spr.screenCenter(X);
            spr.y = 180 + (i * 100);
            add(spr);
            optionSprites.push(spr);
        }

        updateSelection();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.justPressed.UP) {
            curSelected = (curSelected - 1 + optionSprites.length) % optionSprites.length;
            updateSelection();
        }

        if (FlxG.keys.justPressed.DOWN) {
            curSelected = (curSelected + 1) % optionSprites.length;
            updateSelection();
        }

        if (FlxG.keys.justPressed.ENTER) {
            selectOption();
        }

        if (FlxG.keys.justPressed.M) {
            FlxG.switchState(new ModsMenuState());
        }
    }

    function updateSelection():Void {
        for (i in 0...optionSprites.length) {
            optionSprites[i].animation.play(i == curSelected ? "select" : "idle");
        }
    }

    function selectOption():Void {
        switch (curSelected) {
            case 0:
                FlxG.switchState(new MainMenuState());
            case 1:
                FlxG.switchState(new MainMenuState());
            case 2:
                FlxG.switchState(new MainMenuState());
            case 3:
                FlxG.switchState(new MainMenuState());
        }
    }
}
//moichi will kill you :3
