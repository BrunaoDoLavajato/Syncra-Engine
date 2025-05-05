package;

import openfl.display.Sprite;
import openfl.Lib;
import Main;

class ApplicationMain extends Sprite {
    public function new() {
        super();
        var main = new Main();
        addChild(main);
    }

    public static function main() {
        Lib.current.addChild(new ApplicationMain());
    }
}
