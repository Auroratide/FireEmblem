package com.auroratide.fireemblem.loader;

import com.auroratide.mockit.Arguments;
import com.auroratide.fireemblem.mock.map.MockFeTilesheet;

@integration class TilesetLoaderTest extends Test {

    public function testLoadDevSet() {
        var tilesheet = null;
        var loader = new TilesetLoader("dev");
        var tileset = loader.load();

        assertThat(tileset.get(0, 0, tilesheet).name(), Is("Grass"));
        assertThat(tileset.get(1, 0, tilesheet).name(), Is("Logs"));
        assertThat(tileset.get(2, 0, tilesheet).name(), Is("Sand"));
        assertThat(tileset.get(3, 0, tilesheet).name(), Is("Water"));
    }

}