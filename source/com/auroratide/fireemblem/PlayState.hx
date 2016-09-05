package com.auroratide.fireemblem;

import com.auroratide.fireemblem.map.MapCursor;
import com.auroratide.fireemblem.loader.TilesheetLoader;
import com.auroratide.fireemblem.loader.TilesetLoader;
import flixel.FlxSprite;
import flixel.FlxState;

import com.auroratide.fireemblem.loader.MapLoader;

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

        var map = new MapLoader(3, new TilesetLoader(""), new TilesheetLoader("")).load();
        var cursor = new MapCursor(map);

        add(map);
        add(cursor);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function destroy():Void {
        super.destroy();
    }

}
