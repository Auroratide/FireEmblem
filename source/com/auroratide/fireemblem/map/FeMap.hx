package com.auroratide.fireemblem.map;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

import com.auroratide.fireemblem.util.Warning;

class FeMap extends FlxTypedGroup<FeTile> {

    public var rows(default, null):Int;
    public var cols(default, null):Int;

/*  Constructor
 *  =========================================================================*/
    public function new(rows:Int, cols:Int) {
        super();
        this.rows = rows;
        this.cols = cols;
    }

    public static function create(rows:Int, cols:Int, tiles:Iterable<FeTile>):FeMap {
        var map = new FeMap(rows, cols);
        var i = 0;
        for(tile in tiles) {
            tile.x = (i % cols) * Constants.TILE_PIXEL_WIDTH;
            tile.y = Math.floor(i / cols) * Constants.TILE_PIXEL_HEIGHT;
            map.add(tile);
            ++i;
        }

        Warning.warn("Mismatch between rows * cols and number of tiles when creating an FeMap", i != rows * cols);
        return map;
    }

/*  Public Methods
 *  =========================================================================*/
    public function tile(row:Int, col:Int):FeTile {
        return members[col + cols * row];
    }

}
