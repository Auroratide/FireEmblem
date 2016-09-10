package com.auroratide.fireemblem;

class FeMath {

    public static inline function tilesWidth(tiles:Int):Int {
        return tiles * Constants.TILE_PIXEL_WIDTH;
    }

    public static inline function tilesHeight(tiles:Int):Int {
        return tiles * Constants.TILE_PIXEL_HEIGHT;
    }

}
