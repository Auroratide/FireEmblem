package com.auroratide.fireemblem.loader;

import flixel.graphics.FlxGraphic;
import com.auroratide.fireemblem.map.FeTilesheet;

class TilesheetLoader implements AssetLoader<FeTilesheet> {

    private var name:String;

    public function new(name:String) {
        this.name = name;
    }

    public function set(name:String):AssetLoader<FeTilesheet> {
        this.name = name;
        return this;
    }

    public function load():FeTilesheet {
        return FlxGraphic.fromAssetKey(Paths.TILESHEET + name + ".png");
    }

}
