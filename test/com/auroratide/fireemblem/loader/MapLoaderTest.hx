package com.auroratide.fireemblem.loader;

class MapLoaderTest extends Test {

    public function testLoadMap99() {
        var loader = new MapLoader(99);
        var map = loader.load();

        assertEquals(1, map.rows);
        assertEquals(1, map.cols);
    }

    public function testLoadMap98() {
        var loader = new MapLoader(98);
        var map = loader.load();

        assertEquals(2, map.rows);
        assertEquals(3, map.cols);
    }

}