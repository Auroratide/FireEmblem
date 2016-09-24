package com.auroratide.fireemblem.map;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

@unit @ignore class MapCursorTest extends Test {

    private var map:FeMap;

    private var cursor:MapCursor;

    override public function setup() {
        map = new FeMap(0, 0);
        cursor = new MapCursor(map);
    }

    public function testRight() {
        cursor.x = 0;
        cursor.right();

        assertEquals(Constants.TILE_PIXEL_WIDTH * 1.0, cursor.x);
    }

    public function testUp() {
        cursor.y = 0;
        cursor.up();

        assertEquals(-Constants.TILE_PIXEL_HEIGHT * 1.0, cursor.y);
    }

    public function testDown() {
        cursor.y = 0;
        cursor.down();

        assertEquals(Constants.TILE_PIXEL_HEIGHT * 1.0, cursor.y);
    }

    public function testLeft() {
        cursor.x = 0;
        cursor.left();

        assertEquals(-Constants.TILE_PIXEL_WIDTH * 1.0, cursor.x);
    }

}