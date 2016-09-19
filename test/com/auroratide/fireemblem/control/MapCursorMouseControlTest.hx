package com.auroratide.fireemblem.control;

import com.auroratide.fireemblem.map.MapCursor;
import mockatoo.Mockatoo;
import flixel.FlxCamera;
import com.auroratide.fireemblem.mock.map.MockMapCursor;
import flixel.input.mouse.FlxMouse;

class MapCursorMouseControlTest extends Test {

    private var mouse:FlxMouse;
    private var cursor:MockMapCursor;
    private var camera:FlxCamera;

    private var control:MapCursorMouseControl;

    override public function setup():Void {
        mouse = Mockatoo.mock(FlxMouse);
        cursor = new MockMapCursor();
        camera = Mockatoo.mock(FlxCamera);

        control = new MapCursorMouseControl(mouse, cursor, camera);
    }

    public function testShouldCompile() {

        assertMockatoo();

    }

}