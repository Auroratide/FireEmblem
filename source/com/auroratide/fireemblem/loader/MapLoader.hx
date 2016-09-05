package com.auroratide.fireemblem.loader;

import flixel.FlxSprite;
class MapLoader extends JsonLoader<FeMap> {

    public function new(chapter:Int) {
        super(buildPath(chapter));
    }

    override private function parse(json:Dynamic):FeMap {
        var tile = new FlxSprite()
            .loadGraphic("assets/images/tilesheets/dev.png", true, Constants.TILE_PIXEL_WIDTH, Constants.TILE_PIXEL_HEIGHT);

        var tiles = new Array<FlxSprite>();
        tiles.push(tile);
        return FeMap.create(1, 1, tiles);
    }

    private function buildPath(chapter:Int):String {
        var buf = new StringBuf();
        buf.add(Paths.CHAPTER);
        if(chapter < 10)
            buf.add("0");
        buf.add(Std.string(chapter));
        buf.add("/");
        buf.add(Paths.MAP);
        return buf.toString();
    }

}
