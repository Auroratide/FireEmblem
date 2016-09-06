package com.auroratide.fireemblem.control;

import flixel.FlxG;
import flixel.FlxBasic;
import com.auroratide.fireemblem.config.Keybinds;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorKeyboardControl extends FlxBasic {

    public function new(keybinds:Keybinds, cursor:MapCursor) {
        super();
        this.keybinds = keybinds;
        this.cursor = cursor;
    }

/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(FlxG.keys.anyJustPressed(keybinds.up))
            cursor.up();
        if(FlxG.keys.anyJustPressed(keybinds.right))
            cursor.right();
        if(FlxG.keys.anyJustPressed(keybinds.down))
            cursor.down();
        if(FlxG.keys.anyJustPressed(keybinds.left))
            cursor.left();
    }

/*  Private Members
 *  =========================================================================*/
    private var keybinds:Keybinds;
    private var cursor:MapCursor;
}
