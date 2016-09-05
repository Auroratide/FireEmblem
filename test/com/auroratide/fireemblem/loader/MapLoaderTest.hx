package com.auroratide.fireemblem.loader;

import com.auroratide.fireemblem.map.FeTilesheet;
import com.auroratide.fireemblem.map.FeTileset;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class MapLoaderTest extends Test {
/*
    private var tilesetLoader:AssetLoader<FeTileset>;
    private var tilesheetLoader:AssetLoader<FeTilesheet>;

    public function setUp() {
        tilesetLoader = mock(AssetLoader, [FeTileset]);
        tilesheetLoader = mock(AssetLoader, [FeTilesheet]);

        tilesetLoader.set("dev").returns(tilesetLoader);
        tilesetLoader.load().returns();

        tilesheetLoader.set("dev").returns(tilesheetLoader);
    }

    public function testLoadMap99() {
        var loader = new MapLoader(99, tilesetLoader, tilesheetLoader);
        var map = loader.load();

        tilesetLoader.set("dev").verify();
        tilesheetLoader.set("dev").verify();

        assertEquals(1, map.rows);
        assertEquals(1, map.cols);
        assertEquals(1, map.length);
    }

    public function testLoadMap98() {
        var loader = new MapLoader(98);
        var map = loader.load();

        assertEquals(2, map.rows);
        assertEquals(3, map.cols);
        assertEquals(6, map.length);
    }

    */

}