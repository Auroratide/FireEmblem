package com.auroratide.fireemblem.map;

import flixel.math.FlxPoint;
import flixel.FlxSprite;

class MapCursor extends FlxSprite {

/*  Constructor
 *  =========================================================================*/
    public function new(map:FeMap) {
        super();
        this.map = map;
        initGraphic();
    }

/*  Private Members
 *  =========================================================================*/
    private var map:FeMap;

/*  Private Methods
 *  =========================================================================*/
    private function initGraphic():Void {
        offset = FlxPoint.get(
            (Constants.CURSOR_PIXEL_WIDTH - Constants.TILE_PIXEL_WIDTH) / 2,
            (Constants.CURSOR_PIXEL_HEIGHT - Constants.TILE_PIXEL_HEIGHT) / 2
        );

        loadGraphic(Paths.CURSOR, true, Constants.CURSOR_PIXEL_WIDTH, Constants.CURSOR_PIXEL_HEIGHT);
        animation.add("idle", [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2]);
        animation.play("idle");
    }
}
