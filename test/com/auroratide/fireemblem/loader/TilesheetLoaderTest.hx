package com.auroratide.fireemblem.loader;

import com.auroratide.mockit.Arguments;

class TilesheetLoaderTest extends Test {

    public function testLoad() {
        var loader = new TilesheetLoader("dev");
        var tilesheet = loader.load();

        assertThat(tilesheet, IsNotNull);
    }

}