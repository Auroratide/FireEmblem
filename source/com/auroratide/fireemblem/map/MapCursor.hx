package com.auroratide.fireemblem.map;

import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.math.FlxMath;

class MapCursor extends FlxSprite {

    public var row(get, never):Int;
    public var col(get, never):Int;

/*  Constructor
 *  =========================================================================*/
    public function new(map:FeMap) {
        super();
        this.map = map;
        initGraphic();
    }

/*  Flixel API
 *  =========================================================================*/
    override public function setPosition(x:Float = 0, y:Float = 0):Void {
        this.x = FlxMath.bound(
            Math.floor(x / Constants.TILE_PIXEL_WIDTH) * Constants.TILE_PIXEL_WIDTH,
            map.bounds.left,
            map.bounds.right - Constants.TILE_PIXEL_WIDTH
        );
        this.y = FlxMath.bound(
            Math.floor(y / Constants.TILE_PIXEL_HEIGHT) * Constants.TILE_PIXEL_HEIGHT,
            map.bounds.top,
            map.bounds.bottom - Constants.TILE_PIXEL_HEIGHT
        );
    }

/*  Public Methods
 *  =========================================================================*/
    public function up():Void {
        if(y > map.bounds.top) y -= Constants.TILE_PIXEL_HEIGHT;
    }

    public function right():Void {
        if(x < map.bounds.right - Constants.TILE_PIXEL_WIDTH) x += Constants.TILE_PIXEL_WIDTH;
    }

    public function down():Void {
        if(y < map.bounds.bottom - Constants.TILE_PIXEL_HEIGHT) y += Constants.TILE_PIXEL_HEIGHT;
    }

    public function left():Void {
        if(x > map.bounds.left) x -= Constants.TILE_PIXEL_WIDTH;
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

    private function get_row():Int {
        return Math.floor(y / Constants.TILE_PIXEL_HEIGHT);
    }

    private function get_col():Int {
        return Math.floor(x / Constants.TILE_PIXEL_WIDTH);
    }
}
