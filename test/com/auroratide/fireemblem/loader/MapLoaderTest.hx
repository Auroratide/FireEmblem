package com.auroratide.fireemblem.loader;

import com.auroratide.fireemblem.map.FeTile;
import openfl.Assets;

import flixel.graphics.FlxGraphic;

import com.auroratide.fireemblem.map.FeTilesheet;
import com.auroratide.fireemblem.map.FeTileset;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class MapLoaderTest extends Test {

    private var tilesheet:FeTilesheet;
    private var tileset:FeTileset;

    private var tilesetLoader:AssetLoader<FeTileset>;
    private var tilesheetLoader:AssetLoader<FeTilesheet>;

    override public function setup() {
        tilesheet = FlxGraphic.fromBitmapData(Assets.getBitmapData(Test.TILESET_PATH));
        tileset = mock(FeTileset);
        Mockatoo.when(tileset.get(cast anyInt, cast anyInt, tilesheet))
            .thenReturn(new FeTile(), new FeTile(), new FeTile(),
                        new FeTile(), new FeTile(), new FeTile());

        tilesetLoader = mock(AssetLoader, [FeTileset]);
        tilesheetLoader = mock(AssetLoader, [FeTilesheet]);

        tilesetLoader.set("dev").returns(tilesetLoader);
        tilesetLoader.load().returns(tileset);

        tilesheetLoader.set("dev").returns(tilesheetLoader);
        tilesheetLoader.load().returns(tilesheet);
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
        var loader = new MapLoader(98, tilesetLoader, tilesheetLoader);
        var map = loader.load();

        tilesetLoader.set("dev").verify();
        tilesheetLoader.set("dev").verify();

        assertEquals(2, map.rows);
        assertEquals(3, map.cols);
        assertEquals(6, map.length);
    }

}