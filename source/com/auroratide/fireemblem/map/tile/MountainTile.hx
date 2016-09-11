package com.auroratide.fireemblem.map.tile;

class MountainTile extends FeTile {
    public function new() {
        super();
    }

/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Mountain";

    override public function def():Int
        return 2;

    override public function avoid():Int
        return 40;

    override public function hit():Int
        return 10;
}
