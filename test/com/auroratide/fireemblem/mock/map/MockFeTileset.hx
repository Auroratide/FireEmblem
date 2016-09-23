package com.auroratide.fireemblem.mock.map;

import com.auroratide.fireemblem.map.FeTile;
import com.auroratide.fireemblem.map.FeTilesheet;
import com.auroratide.mockit.MockIt;
import com.auroratide.fireemblem.map.FeTileset;

class MockFeTileset extends FeTileset {

    public var mockit:MockIt;

    public function new() {
        super(null, null);
        mockit = new MockIt();
    }

    override public function get(tileIndex:Int, idle:Int, tilesheet:FeTilesheet):FeTile {
        return mockit.call("get", [tileIndex, idle, tilesheet]);
    }

}