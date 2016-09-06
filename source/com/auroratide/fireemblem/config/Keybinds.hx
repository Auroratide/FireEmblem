package com.auroratide.fireemblem.config;

import flixel.input.keyboard.FlxKey;

class Keybinds {

    public var up(default, null):Array<Int>;
    public var right(default, null):Array<Int>;
    public var down(default, null):Array<Int>;
    public var left(default, null):Array<Int>;

    public var directions(default, null):Array<Int>;

    public function new() {
        up    = [FlxKey.UP];
        right = [FlxKey.RIGHT];
        down  = [FlxKey.DOWN];
        left  = [FlxKey.LEFT];

        directions = up.concat(right).concat(down).concat(left);
    }

}
