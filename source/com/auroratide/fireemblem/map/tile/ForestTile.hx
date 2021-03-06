package com.auroratide.fireemblem.map.tile;
class ForestTile extends FeTile {
    public function new() {
        super();
    }

/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Forest";

    override public function def():Int
        return 1;

    override public function avoid():Int
        return 20;

    override public function hit():Int
        return -5;
}
