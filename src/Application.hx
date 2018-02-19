package;

import js.Lib;
import phaser.Game;
import phaser.Phaser;
import phaser.Point;
import ash.core.Entity;
import ash.core.Engine;
import ash.tools.ListIteratingSystem;
import ash.core.Node;
import whiplash.*;
import ash.fsm.*;

import vm.VirtualMachineSystem;

import js.jquery.*;
import js.UIPages;
import js.PagesSet;

class Appliation {
    var pages:PagesSet;
    public var game:Game;
    public var engine:Engine;
    var esm:EngineStateMachine;

    public function new() {
        instance = this;
        game = new Game(1280, 720, Phaser.CANVAS, 'Destruction jam', { preload:preload, create:create, update:update });
        engine = new Engine();
        whiplash.Lib.init(game, engine);
    }

    function preload():Void {
        Factory.init(game);
        AudioManager.preload(game);
    }

    function create():Void {
        game.world.setBounds(-10000, -10000, 20000, 20000);
        AudioManager.init(game);
    }

    function update():Void {
        engine.update(game.time.elapsed / 1000);
    }


    public function changeState(stateName) {
        engine.updateComplete.addOnce(function() {
            esm.changeState(stateName);
        });
    }

    public function onGuiLoaded() {
    }

    static function main():Void {
        new Application();
    }
}
