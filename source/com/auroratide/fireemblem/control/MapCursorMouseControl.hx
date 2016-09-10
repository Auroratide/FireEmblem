package com.auroratide.fireemblem.control;

import flixel.FlxCamera;
import flixel.math.FlxPoint;
import flixel.FlxBasic;
import flixel.input.mouse.FlxMouse;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorMouseControl extends FlxBasic {

/*  Constructor
 *  =========================================================================*/
    public function new(mouse:FlxMouse, cursor:MapCursor, camera:FlxCamera) {
        super();
        this.mouse = mouse;
        this.cursor = cursor;
        this.camera = camera;
        this.globalMouse = new FlxPoint();
    }


/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        mouse.getWorldPosition(camera, globalMouse);
        cursor.setPosition(globalMouse.x, globalMouse.y);
    }


/*  Private Members
 *  =========================================================================*/
    private var mouse:FlxMouse;
    private var cursor:MapCursor;
    private var globalMouse:FlxPoint;

}
