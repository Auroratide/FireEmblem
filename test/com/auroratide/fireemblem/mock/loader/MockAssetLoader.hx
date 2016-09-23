package com.auroratide.fireemblem.mock.loader;

import com.auroratide.mockit.MockIt;
import com.auroratide.fireemblem.loader.AssetLoader;

class MockAssetLoader<T> implements AssetLoader<T> {

    public var mockit:MockIt;

    public function new() {
        mockit = new MockIt();
    }

    public function set(data:String):AssetLoader<T> {
        return mockit.call("set", [data], this);
    }

    public function load():T {
        return mockit.call("load", []);
    }

}