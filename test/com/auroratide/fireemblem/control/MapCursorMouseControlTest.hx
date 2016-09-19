package com.auroratide.fireemblem.control;

import flixel.math.FlxPoint;
import flixel.FlxGame;
import flixel.FlxG;
import com.auroratide.fireemblem.mock.flixel.input.mouse.MockFlxMouse;
import com.auroratide.fireemblem.mock.flixel.MockFlxCamera;
import flixel.FlxCamera;
import com.auroratide.fireemblem.mock.map.MockMapCursor;
import flixel.input.mouse.FlxMouse;

class MapCursorMouseControlTest extends Test {

    private var mouse:MockFlxMouse;
    private var cursor:MockMapCursor;
    private var camera:MockFlxCamera;

    private var control:MapCursorMouseControl;

    override public function setup():Void {
        new FlxGame();

        mouse = new MockFlxMouse();
        cursor = new MockMapCursor();
        camera = new MockFlxCamera();

        control = new MapCursorMouseControl(mouse, cursor, camera);
    }

    public function testShouldUpdateCursorPosition() {
        when(mouse, "getWorldPosition").then(FlxPoint.get(1, 2));
        control.update(1);
        verify(cursor, "setPosition", [1, 2]);
    }

}