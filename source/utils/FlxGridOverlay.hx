package utils;

import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxColor;

class FlxGridOverlay {
    public static function create(
        cellWidth:Int,
        cellHeight:Int,
        width:Int,
        height:Int,
        verticalLines:Bool = true,
        ?color1:FlxColor,
        ?color2:FlxColor
    ):FlxTypedGroup<FlxSprite> {
        if (color1 == null) color1 = FlxColor.GRAY;
        if (color2 == null) color2 = FlxColor.fromRGB(64, 64, 64);

        var group = new FlxTypedGroup<FlxSprite>();
        var cols = Math.ceil(width / cellWidth);
        var rows = Math.ceil(height / cellHeight);

        for (y in 0...rows) {
            for (x in 0...cols) {
                var block = new FlxSprite(x * cellWidth, y * cellHeight);
                var color = ((x + y) % 2 == 0) ? color1 : color2;
                block.makeGraphic(cellWidth, cellHeight, color);
                group.add(block);
            }
        }

        return group;
    }
}
