package utils;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class FlxGridOverlay {
    /**
     * Creates a simple checkerboard overlay by generating a FlxGroup of solids.
     */
    public static function create(
        cellWidth:Int,
        cellHeight:Int,
        width:Int,
        height:Int
    ):FlxGroup {
        var group = new FlxGroup();
        var cols = Math.ceil(width / cellWidth);
        var rows = Math.ceil(height / cellHeight);

        // two alternating colors
        var c1 = FlxColor.GRAY;
        var c2 = FlxColor.fromRGB(64, 64, 64);

        for (y in 0...rows) {
            for (x in 0...cols) {
                var block = new FlxSprite(x * cellWidth, y * cellHeight);
                var color = ((x + y) % 2 == 0) ? c1 : c2;
                block.makeGraphic(cellWidth, cellHeight, color);
                block.alpha = 0.2;
                group.add(block);
            }
        }

        return group;
    }
}
