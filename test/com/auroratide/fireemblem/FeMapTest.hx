package com.auroratide.fireemblem;

import flixel.FlxSprite;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class FeMapTest extends Test {

    public function testCreate() {
        var tile01 = new FlxSprite();
        var tile02 = new FlxSprite();
        var tiles = new Array<FlxSprite>();
        tiles.push(tile01);
        tiles.push(tile02);
        var map = FeMap.create(1, 2, tiles);

        assertEquals(1, map.rows);
        assertEquals(2, map.cols);
        assertEquals(2, map.length);
        assertEquals(tile01, map.members[0]);
        assertEquals(tile02, map.members[1]);
    }

}