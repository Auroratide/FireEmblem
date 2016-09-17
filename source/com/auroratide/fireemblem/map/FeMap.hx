package com.auroratide.fireemblem.map;

import flixel.FlxSprite;
import flixel.math.FlxRect;
import flixel.group.FlxGroup;

import com.auroratide.fireemblem.util.Warning;

class FeMap extends FlxTypedGroup<FeTile> {

    public var rows(default, null):Int;
    public var cols(default, null):Int;
    public var bounds(default, null):FlxRect;

    private var rowPadding:Int;
    private var colPadding:Int;

/*  Constructor
 *  =========================================================================*/
    public function new(rows:Int, cols:Int, rowPadding = 0, colPadding = 0) {
        super();
        this.rows = rows;
        this.cols = cols;
        this.rowPadding = rowPadding;
        this.colPadding = colPadding;
    }

    public static function create(rows:Int, cols:Int, rowPadding:Int, colPadding:Int, tiles:Iterable<FeTile>):FeMap {
        var map = new FeMap(rows, cols, rowPadding, colPadding);
        var i = 0;
        for(tile in tiles) {
            tile.x = (i % cols) * Constants.TILE_PIXEL_WIDTH;
            tile.y = Math.floor(i / cols) * Constants.TILE_PIXEL_HEIGHT;
            map.add(tile);
            ++i;
        }

        map.bounds = FlxRect.get(
            colPadding * Constants.TILE_PIXEL_WIDTH,
            rowPadding * Constants.TILE_PIXEL_HEIGHT,
            (cols - 2 * colPadding - 1) * Constants.TILE_PIXEL_WIDTH,
            (rows - 2 * rowPadding - 1) * Constants.TILE_PIXEL_HEIGHT
        );

        Warning.warn("Mismatch between rows * cols and number of tiles when creating an FeMap", i != rows * cols);
        return map;
    }

/*  Public Methods
 *  =========================================================================*/
    public function tile(row:Int, col:Int):FeTile {
        return members[col + cols * row];
    }

}
