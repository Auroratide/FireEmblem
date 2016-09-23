package com.auroratide.fireemblem.loader;

import com.auroratide.mockit.Arguments;
import com.auroratide.fireemblem.map.FeTilesheet;
import com.auroratide.fireemblem.mock.map.MockFeTilesheet;
import com.auroratide.fireemblem.mock.map.MockFeTileset;
import com.auroratide.fireemblem.mock.loader.MockAssetLoader;
import com.auroratide.fireemblem.map.FeTile;
import com.auroratide.fireemblem.map.FeTileset;

class MapLoaderTest extends Test {

    private var tilesetLoader:MockAssetLoader<FeTileset>;
    private var tilesheetLoader:MockAssetLoader<FeTilesheet>;
    private var loader:MapLoader;

    override public function setup():Void {
        tilesetLoader = new MockAssetLoader<FeTileset>();
        tilesheetLoader = new MockAssetLoader<FeTilesheet>();

        var tileset = new MockFeTileset();

        when(tilesetLoader, "load").then(tileset);
        when(tilesheetLoader, "load").then(new MockFeTilesheet());

        var stub = when(tileset, "get", [Any, Any, Any]);
        for(i in 0...450)
            stub.then(new FeTile());
    }

    public function testLoadMap99() {
        loader = new MapLoader(99, tilesetLoader, tilesheetLoader);
        var map = loader.load();

        verify(tilesetLoader,   "set", ["dev"]);
        verify(tilesheetLoader, "set", ["dev"]);
        assertThat(map.rows, Is(1));
        assertThat(map.cols, Is(1));
        assertThat(map.length, Is(1));
    }

    public function testLoadMap98() {
        loader = new MapLoader(98, tilesetLoader, tilesheetLoader);
        var map = loader.load();

        verify(tilesetLoader,   "set", ["dev"]);
        verify(tilesheetLoader, "set", ["dev"]);
        assertThat(map.rows, Is(18));
        assertThat(map.cols, Is(25));
        assertThat(map.length, Is(450));
    }

}