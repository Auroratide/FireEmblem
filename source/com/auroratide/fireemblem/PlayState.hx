package com.auroratide.fireemblem;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState {

/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
    }

/*  Flixel API
 *  =========================================================================*/
    override public function create():Void {
        super.create();

        var tile = new FlxSprite()
            .loadGraphic("assets/images/tilesheets/dev.png", true, Constants.TILE_PIXEL_WIDTH, Constants.TILE_PIXEL_HEIGHT);

        var tiles = new Array<FlxSprite>();
        tiles.push(tile);

        var map = FeMap.create(1, 1, tiles);

        add(map);

    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function destroy():Void {
        super.destroy();
    }

}
