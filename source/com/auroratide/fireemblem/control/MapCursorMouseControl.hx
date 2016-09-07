package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.mouse.FlxMouse;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorMouseControl extends FlxBasic {

/*  Constructor
 *  =========================================================================*/
    public function new(mouse:FlxMouse, cursor:MapCursor) {
        super();
        this.mouse = mouse;
        this.cursor = cursor;
    }


/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        cursor.setPosition(mouse.x, mouse.y);
    }


/*  Private Members
 *  =========================================================================*/
    private var mouse:FlxMouse;
    private var cursor:MapCursor;

}
