package com.auroratide.fireemblem.mock.flixel.input.mouse;

import openfl.display.Sprite;

import flixel.math.FlxPoint;
import flixel.FlxCamera;
import flixel.input.mouse.FlxMouse;

class MockFlxMouse extends FlxMouse {

    public var verifier:MockVerifier;
    public var stubber:MockStubber;

    public function new() {
        super(new Sprite());
        verifier = new MockVerifier();
        stubber  = new MockStubber();
    }

    override public function getWorldPosition(?Camera:FlxCamera, ?point:FlxPoint):FlxPoint {
        verifier.set("getWorldPosition", [Camera, point]);
        var pt:FlxPoint = stubber.next("getWorldPosition");
        point.set(pt.x, pt.y);
        return pt;
    }

}