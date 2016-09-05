package com.auroratide.fireemblem.map;

import flixel.FlxSprite;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class FeMapTest extends Test {

    public function testCreate() {
        var tile01 = new FeTile();
        var tile02 = new FeTile();
        var tiles = new Array<FeTile>();
        tiles.push(tile01);
        tiles.push(tile02);
        var map = FeMap.create(1, 2, tiles);

        assertEquals(1, map.rows);
        assertEquals(2, map.cols);
        assertEquals(2, map.length);
        assertEquals(tile01, map.members[0]);
        assertEquals(tile02, map.members[1]);
        assertEquals(0.0, tile01.x);
        assertEquals(Constants.TILE_PIXEL_WIDTH * 1.0, tile02.x);
    }

}