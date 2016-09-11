package com.auroratide.fireemblem.map.tile;
class WaterTile extends FeTile {

    public function new() {
        super();
    }

/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Water";

    override public function def():Int
        return 1;

    override public function avoid():Int
        return 10;

    override public function hit():Int
        return 0;
}
