package com.auroratide.fireemblem.map;

import flixel.util.FlxColor;
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
            (cols - 2 * colPadding) * Constants.TILE_PIXEL_WIDTH,
            (rows - 2 * rowPadding) * Constants.TILE_PIXEL_HEIGHT
        );

        Warning.warn("Mismatch between rows * cols and number of tiles when creating an FeMap", i != rows * cols);
        return map;
    }

/*  Public Methods
 *  =========================================================================*/
    public function tile(row:Int, col:Int):FeTile {
        return members[col + cols * row];
    }

    public function createBorder(thickness:Int, color:FlxColor):FlxGroup {
        var top = new FlxSprite();
        top.setPosition(bounds.left - thickness, bounds.top - thickness);
        top.makeGraphic(Std.int(bounds.width), thickness, color);

        var right = new FlxSprite();
        right.setPosition(bounds.right, bounds.top - thickness);
        right.makeGraphic(thickness, Std.int(bounds.height), color);

        var bottom = new FlxSprite();
        bottom.setPosition(bounds.left - thickness, bounds.bottom);
        bottom.makeGraphic(Std.int(bounds.width), thickness, color);

        var left = new FlxSprite();
        left.setPosition(bounds.left - thickness, bounds.top - thickness);
        left.makeGraphic(thickness, Std.int(bounds.height), color);

        var border = new FlxGroup();
        border.add(top);
        border.add(right);
        border.add(bottom);
        border.add(left);

        return border;
    }

}
