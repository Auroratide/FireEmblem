package com.auroratide.fireemblem.mock.flixel;

import flixel.FlxCamera;
import flixel.FlxBasic;
import com.auroratide.mockit.MockIt;

class MockFlxBasic extends FlxBasic {

    public var mockit:MockIt;

    public function new() {
        super();
        mockit = new MockIt();
    }

    override public function destroy():Void {
        mockit.call("destroy", []);
    }

    override public function kill():Void {
        mockit.call("kill", []);
    }

    override public function revive():Void {
        mockit.call("revive", []);
    }

    override public function update(elapsed:Float):Void {
        mockit.call("update", [elapsed]);
    }

    override public function draw():Void {
        mockit.call("draw", []);
    }

    override public function toString():String {
        return mockit.call("toString", []);
    }

    override private function set_visible(Value:Bool):Bool {
        return mockit.call("visible", [Value], false);
    }

    override private function set_active(Value:Bool):Bool {
        return mockit.call("active", [Value], false);
    }

    override private function set_exists(Value:Bool):Bool {
        return mockit.call("exists", [Value], false);
    }

    override private function set_alive(Value:Bool):Bool {
        return mockit.call("alive", [Value], false);
    }

    override private function get_camera():FlxCamera {
        return mockit.call("camera", []);
    }

    override private function set_camera(Value:FlxCamera):FlxCamera {
        return mockit.call("camera", [Value]);
    }

    override private function get_cameras():Array<FlxCamera> {
        return mockit.call("cameras", []);
    }

    override private function set_cameras(Value:Array<FlxCamera>):Array<FlxCamera> {
        return mockit.call("cameras", [Value]);
    }

}