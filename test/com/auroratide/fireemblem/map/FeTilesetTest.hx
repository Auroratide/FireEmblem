package com.auroratide.fireemblem.map;

import flixel.graphics.FlxGraphic;
import openfl.Assets;
import flixel.graphics.frames.FlxFramesCollection.FlxFrameCollectionType;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class FeTilesetTest extends Test {

    private var names:Array<String>;
    private var idles:Array<Array<Array<Int>>>;
    private var tileset:FeTileset;
    private var tilesheet:FeTilesheet;

    override public function setup() {
        names = ["forest", "mountain"];
        idles = [ [ [0], [1] ], [ [2] ] ];

        tileset = new FeTileset(names, idles);
        tilesheet = FlxGraphic.fromBitmapData(Assets.getBitmapData("assets/images/tilesheets/dev.png"));
    }

    public function testGetForestTile() {
        var tile = tileset.get(0, 1, tilesheet);

        assertEquals(1, tile.animation.frameIndex);
    }

    public function testGetMountainTile() {
        var tile = tileset.get(1, 0, tilesheet);

        assertEquals(2, tile.animation.frameIndex);
    }

}