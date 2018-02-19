import ash.systems.*;
import ash.fsm.*;
import ash.core.*;
import whiplash.*;
import vm.VirtualMachineComponent;

class Factory {
    public static var files:Array<String> = Macro.getFilePaths("textures");

    static public function init(game:phaser.Game) {
        for(file in files) {
            var name = new haxe.io.Path(file).file;
            game.load.image(name, file);
        }
        game.load.spritesheet('explosion', '../data/spritesheets/explosion.png', 96, 96);
    }

    static public function createExplosion() {
        var e = new Entity();
        e.add(new Transform());
        e.add(new Sprite());
        e.add(new Remove(0.6));
        e.get(Transform).scale = new Point(2, 2);
        e.get(Sprite).loadTexture("explosion");
        e.get(Sprite).animations.add("explosion");
        e.get(Sprite).animations.play("explosion", 30, true);
        e.get(Sprite).z = 3;
        e.get(Sprite).anchor = new Point(0.5, 0.5);
        return e;
    }

}
