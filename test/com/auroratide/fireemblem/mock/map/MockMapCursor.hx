package com.auroratide.fireemblem.mock.map;

import com.auroratide.fireemblem.map.MapCursor;

class MockMapCursor extends MapCursor {

    public var verifier:MockVerifier;
    public var stubber:MockStubber;

    public function new() {
        super(null);
        verifier = new MockVerifier();
        stubber = new MockStubber();
    }

    override public function setPosition(x = 0.0, y = 0.0):Void {
        verifier.set("setPosition", [x, y]);
    }

    override public function up():Void {
        verifier.set("up", []);
    }

    override public function right():Void {
        verifier.set("right", []);
    }

    override public function down():Void {
        verifier.set("down", []);
    }

    override public function left():Void {
        verifier.set("left", []);
    }

    override private function get_row():Int {
        return stubber.nextInt("row");
    }

    override private function get_col():Int {
        return stubber.nextInt("col");
    }

}