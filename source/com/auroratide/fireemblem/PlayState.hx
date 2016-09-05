package com.auroratide.fireemblem;

import flixel.FlxSprite;
import flixel.FlxState;

import com.auroratide.fireemblem.loader.MapLoader;

class PlayState extends FlxState {

/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
    }

/*  Flixel API
 *  =========================================================================*/
    override public function create():Void {
        super.create();

        var map = new MapLoader(99).load();

        add(map);

    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function destroy():Void {
        super.destroy();
    }

}
