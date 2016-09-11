package com.auroratide.fireemblem.map;

import com.auroratide.fireemblem.error.NotFoundError;
import flixel.FlxSprite;

class FeTile extends FlxSprite {
    public function new() {
        super();
    }

    public static function create(name:String):FeTile {
        var tileClass = Type.resolveClass('com.auroratide.fireemblem.map.tile.${name}Tile');
        if(tileClass == null)
            throw new NotFoundError('Class for $name Tile could not be found.', "FeTile create");
        return Type.createInstance(tileClass, []);
    }

/*  Tile Properties
 *  =========================================================================*/
    public function name():String
        return "UNNAMED TILE!";

    public function def():Int
        return 0;

    public function avoid():Int
        return 0;

    public function hit():Int
        return 0;

}
