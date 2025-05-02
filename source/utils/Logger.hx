package utils;

import sys.io.File;
import sys.FileSystem;
import Date;

class Logger {
    private static var logDir:String = ".SRC ENGINE/logs";
    private static var logFilePath:String = '$logDir/log.txt';

    public static function log(message:String):Void {
        // Ensure the logs directory exists
        if (!FileSystem.exists(logDir)) {
            FileSystem.createDirectory(logDir);
        }

        var timestamp = Date.now().toString();
        var logMessage = '[$timestamp] $message\n';
        File.append(logFilePath, logMessage);
    }

    public static function error(message:String):Void {
        log("[ERROR] " + message);
    }

    public static function info(message:String):Void {
        log("[INFO] " + message);
    }
}
