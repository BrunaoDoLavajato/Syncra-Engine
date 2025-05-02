package utils;

import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.FlxG;

class FlxGridOverlay {
    public static function create(
        cellWidth:Int,
        cellHeight:Int,
        width:Int,
        height:Int,
        verticalLines:Bool = true,
        color1:FlxColor = FlxColor.GRAY,
        color2:FlxColor = FlxColor.DARK_GRAY
    ):FlxTypedGroup<FlxSprite> {
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
