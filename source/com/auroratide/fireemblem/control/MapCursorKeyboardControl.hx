package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.keyboard.FlxKeyboard;
import com.auroratide.fireemblem.config.Keybinds;
import com.auroratide.fireemblem.input.Keyboard;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorKeyboardControl extends FlxBasic {

    public function new(keyboard:Keyboard, cursor:MapCursor) {
        super();
        this.keyboard = keyboard;
        this.cursor = cursor;
    }

/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(keyboard.up.justPressed)
            cursor.up();
        if(keyboard.right.justPressed)
            cursor.right();
        if(keyboard.down.justPressed)
            cursor.down();
        if(keyboard.left.justPressed)
            cursor.left();
    }

/*  Private Members
 *  =========================================================================*/
    private var keyboard:Keyboard;
    private var cursor:MapCursor;
}
