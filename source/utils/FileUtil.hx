package utils;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class FileUtil {
    public static function createDirectory(path:String):Void {
        if (!FileSystem.exists(path)) {
            FileSystem.createDirectory(path);
        }
    }

    public static function writeJson(path:String, data:Dynamic):Void {
        var jsonString = Json.stringify(data, "\t");
        File.saveContent(path, jsonString);
    }

    public static function readJson(path:String):Dynamic {
        if (FileSystem.exists(path)) {
            var content = File.getContent(path);
            return Json.parse(content);
        }
        return null;
    }

    public static function fileExists(path:String):Bool {
        return FileSystem.exists(path);
    }
}
