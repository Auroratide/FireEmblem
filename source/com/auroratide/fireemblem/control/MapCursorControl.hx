package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import com.auroratide.fireemblem.input.GameInput;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorControl extends FlxBasic {

    public function new(input:GameInput, cursor:MapCursor) {
        super();
        this.input = input;
        this.cursor = cursor;
    }

/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(input.up.justPressed)
            cursor.up();
        if(input.right.justPressed)
            cursor.right();
        if(input.down.justPressed)
            cursor.down();
        if(input.left.justPressed)
            cursor.left();
    }

/*  Private Members
 *  =========================================================================*/
    private var input:GameInput;
    private var cursor:MapCursor;
}
