package com.auroratide.fireemblem.map;

import flixel.math.FlxRect;
import flixel.FlxCamera;

class MapCamera extends FlxCamera {

/*  Constructor
 *  =========================================================================*/
    public function new(map:FeMap, cursor:MapCursor) {
        super();
        this.map = map;
        this.cursor = cursor;

        bind();
    }

/*  Private Members
 *  =========================================================================*/
    private var map:FeMap;
    private var cursor:MapCursor;

/*  Private Methods
 *  =========================================================================*/
    private function bind():Void {
        follow(cursor, TOPDOWN, Constants.CAMERA_SENSITIVITY);
        var maxDim = Math.max(this.width, this.height) / 2;
        deadzone = FlxRect.get(
            (this.width - maxDim) / 2,
            (this.height - maxDim) / 2,
            maxDim, maxDim
        );

        setScrollBoundsRect(
            0, 0,
            Math.max(FeMath.tilesWidth(map.cols), this.width),
            Math.max(FeMath.tilesHeight(map.rows), this.height)
        );
    }
}
