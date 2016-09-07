package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.keyboard.FlxKeyboard;
import com.auroratide.fireemblem.config.Keybinds;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorKeyboardControl extends FlxBasic {

    public function new(keyboard:FlxKeyboard, keybinds:Keybinds, cursor:MapCursor) {
        super();
        this.keyboard = keyboard;
        this.keybinds = keybinds;
        this.cursor = cursor;
    }

/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(keyboard.anyJustPressed(keybinds.up))
            cursor.up();
        if(keyboard.anyJustPressed(keybinds.right))
            cursor.right();
        if(keyboard.anyJustPressed(keybinds.down))
            cursor.down();
        if(keyboard.anyJustPressed(keybinds.left))
            cursor.left();
    }

/*  Private Members
 *  =========================================================================*/
    private var keyboard:FlxKeyboard;
    private var keybinds:Keybinds;
    private var cursor:MapCursor;
}
