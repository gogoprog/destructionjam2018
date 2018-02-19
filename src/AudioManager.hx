class AudioManager {
    public static var files:Array<String> = Macro.getFilePaths("sounds");

    static var sounds:Map<String, Dynamic> = new Map();

    static public function preload(game:phaser.Game) {
        for(file in files) {
            var name = new haxe.io.Path(file).file;
            game.load.audio(name, file);
        }
        untyped $global.playSound = playSound;
    }

    static public function init(game:phaser.Game) {
        for(file in files) {
            var name = new haxe.io.Path(file).file;
            sounds[name] = game.add.audio(name);
        }
    }

    static public function playSound(name) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return;
        }
        sounds[name].play();
    }
}
