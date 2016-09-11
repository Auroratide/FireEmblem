package com.auroratide.fireemblem.map.tile;

class HillTile extends FeTile {
    public function new() {
        super();
    }

/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Hill";

    override public function def():Int
        return 2;

    override public function avoid():Int
        return 30;

    override public function hit():Int
        return 5;
}
