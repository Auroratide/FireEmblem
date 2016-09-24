package com.auroratide.fireemblem.mock.map;

import com.auroratide.mockit.MockIt;
import com.auroratide.fireemblem.map.FeMap;

class MockFeMap extends FeMap {

    public var mockit:MockIt;

    public function new() {
        super(0, 0, 0, 0);
        mockit = new MockIt();
    }

}