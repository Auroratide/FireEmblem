package;

import openfl.display.Sprite;

import flixel.FlxGame;

class Main extends Sprite {
    public function new() {
        super();
        addChild(new FlxGame(0, 0, com.auroratide.fireemblem.PlayState));
    }
}
