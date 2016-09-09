package com.auroratide.fireemblem;

import com.auroratide.fireemblem.input.Keyboard;
import com.auroratide.fireemblem.control.MouseToggleControl;
import com.auroratide.fireemblem.control.MapCursorMouseControl;
import com.auroratide.fireemblem.control.MapCursorControl;
import com.auroratide.fireemblem.config.Keybinds;
import com.auroratide.fireemblem.map.MapCursor;
import com.auroratide.fireemblem.loader.TilesheetLoader;
import com.auroratide.fireemblem.loader.TilesetLoader;
import flixel.FlxG;
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

        var keybinds = new Keybinds();
        var keyboard = new Keyboard(FlxG.keys, keybinds);

        var map = new MapLoader(6, new TilesetLoader(""), new TilesheetLoader("")).load();
        var cursor = new MapCursor(map);

        var mouseMovement = new MapCursorMouseControl(FlxG.mouse, cursor);
        var cursorMovement = new MapCursorControl(keyboard, cursor);

        var mouseToggle = new MouseToggleControl(keyboard, FlxG.mouse, [mouseMovement]);

        add(map);
        add(cursor);
        add(mouseMovement);
        add(cursorMovement);
        add(mouseToggle);

        FlxG.camera.follow(cursor);
        FlxG.camera.setScrollBoundsRect(0, 0, map.cols * Constants.TILE_PIXEL_WIDTH, map.rows * Constants.TILE_PIXEL_HEIGHT);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function destroy():Void {
        super.destroy();
    }

}
