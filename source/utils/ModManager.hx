package utils;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class ModManager {
    public static var mods:Array<Dynamic> = [];

    public static function loadMods():Void {
        var modsPath = ".SRC ENGINE/mods/";
        if (!FileSystem.exists(modsPath)) {
            FileUtil.createDirectory(modsPath);
        }

        var modDirs = FileSystem.readDirectory(modsPath);
        for (modDir in modDirs) {
            var modInfoPath = modsPath + modDir + "/Mod-Info.json";
            if (FileSystem.exists(modInfoPath)) {
                var modInfo = FileUtil.readJson(modInfoPath);
                if (modInfo != null) {
                    mods.push(modInfo);
                }
            }
        }
    }

    public static function getModList():Array<Dynamic> {
        return mods;
    }
}
