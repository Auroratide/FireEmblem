package com.auroratide.fireemblem.mock.map;

import com.auroratide.mockit.MockIt;
import com.auroratide.fireemblem.map.FeTilesheet;

class MockFeTilesheet extends FeTilesheet {

    public var mockit:MockIt;

    public function new() {
        super(null, null, false);
        mockit = new MockIt();
    }

}