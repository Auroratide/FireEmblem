package com.auroratide.fireemblem.map;

class FeTileset {

    private var names:Array<String>;
    private var idles:Array<Array<Array<Int>>>;

    public function new(names:Array<String>, idles:Array<Array<Array<Int>>>) {
        this.names = names;
        this.idles = idles;
    }

    public function get(tileIndex:Int, idle:Int, tilesheet:FeTilesheet):FeTile {
        var tile = FeTile.create(names[tileIndex]);
        tile.loadGraphic(tilesheet, true, Constants.TILE_PIXEL_WIDTH, Constants.TILE_PIXEL_HEIGHT);

        var shouldLoop = idles[tileIndex][idle].length > 1;
        tile.animation.add("idle", idles[tileIndex][idle], Constants.ANIMATION_FRAMERATE, shouldLoop);
        tile.animation.play("idle");
        return tile;
    }

}
