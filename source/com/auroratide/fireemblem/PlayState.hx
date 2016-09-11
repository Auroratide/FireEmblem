package com.auroratide.fireemblem;

import com.auroratide.fireemblem.map.tile.HillTile;
import com.auroratide.fireemblem.hud.Hud;
import com.auroratide.fireemblem.map.hud.TileInfoScreen;
import com.auroratide.fireemblem.map.MapCamera;
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

        var camera = new MapCamera(map, cursor);
        FlxG.cameras.add(camera);

        var hud = new Hud(Constants.MAP_HUD_PADDING, Constants.MAP_HUD_PADDING, FlxG.width - 2 * Constants.MAP_HUD_PADDING, FlxG.height - 2 * Constants.MAP_HUD_PADDING);
        var tileScreen = new TileInfoScreen(hud, cursor, camera);
        hud.add(tileScreen);

        var mouseMovement = new MapCursorMouseControl(FlxG.mouse, cursor, camera);
        var cursorMovement = new MapCursorControl(keyboard, cursor);

        var mouseToggle = new MouseToggleControl(keyboard, FlxG.mouse, [mouseMovement]);

        add(map);
        add(cursor);
        add(hud);
        add(mouseMovement);
        add(cursorMovement);
        add(mouseToggle);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }

    override public function destroy():Void {
        super.destroy();
    }

}
