package;

class Main {
	public static function main() {
		trace("Yuri is fucking twelve pussys rn");
		
		Engine.init();

		StateManager.changeState("InitState");

		while (true) {
			StateManager.update();
			Sys.sleep(0.016); // Roughly 60 FPS
		}
	}
}
