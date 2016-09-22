package com.auroratide.fireemblem.mock.flixel.input.mouse;

import openfl.display.Sprite;

import flixel.math.FlxPoint;
import flixel.FlxCamera;
import flixel.input.mouse.FlxMouse;

import com.auroratide.mockit.MockIt;

class MockFlxMouse extends FlxMouse {

    public var mockit:MockIt;

    public function new() {
        super(new Sprite());
        mockit = new MockIt();
    }

    override public function getWorldPosition(?camera:FlxCamera, ?point:FlxPoint):FlxPoint {
        var pt:FlxPoint = mockit.call("getWorldPosition", [camera, point], new FlxPoint());
        point.set(pt.x, pt.y);
        return pt;
    }

    override private inline function get_justPressed():Bool {
        return mockit.call("justPressed", [], false);
    }

}