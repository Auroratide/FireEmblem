package com.auroratide.fireemblem.mock.map;

import com.auroratide.mockit.MockIt;
import com.auroratide.fireemblem.map.MapCursor;

class MockMapCursor extends MapCursor {

    public var mockit:MockIt;

    public function new() {
        super(null);
        mockit = new MockIt();
    }

    override public function update(elapsed:Float):Void {
        mockit.call("update", [elapsed]);
    }

    override public function setPosition(x = 0.0, y = 0.0):Void {
        mockit.call("setPosition", [x, y]);
    }

    override public function up():Void {
        mockit.call("up", []);
    }

    override public function right():Void {
        mockit.call("right", []);
    }

    override public function down():Void {
        mockit.call("down", []);
    }

    override public function left():Void {
        mockit.call("left", []);
    }

    override private function get_row():Int {
        return mockit.call("row", [], 0);
    }

    override private function get_col():Int {
        return mockit.call("col", [], 0);
    }

}