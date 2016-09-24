package com.auroratide.fireemblem.map;

import com.auroratide.mockit.Arguments;

@unit class FeMapTest extends Test {

    private var tile01:FeTile;
    private var tile02:FeTile;
    private var map:FeMap;

    override public function setup():Void {
        tile01 = new FeTile();
        tile02 = new FeTile();
        var tiles = [tile01, tile02];
        map = FeMap.create(1, 2, 0, 0, tiles);
    }

    public function testCreate() {
        assertThat(map.rows, Is(1));
        assertThat(map.cols, Is(2));
        assertThat(map.length, Is(2));
        assertThat(map.members[0], Is(tile01));
        assertThat(map.members[1], Is(tile02));
        assertThat(tile01.x, Is(0));
        assertThat(tile02.x, Is(Constants.TILE_PIXEL_WIDTH * 1.0));
    }

    public function testShouldGetCorrectTile() {
        var tile = map.tile(0, 0);
        assertThat(tile, Is(tile01));

        tile = map.tile(0, 1);
        assertThat(tile, Is(tile02));
    }

}