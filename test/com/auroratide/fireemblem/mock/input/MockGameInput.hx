package com.auroratide.fireemblem.mock.input;

import flixel.input.IFlxInput;
import com.auroratide.fireemblem.input.GameInput;

class MockGameInput implements GameInput {

    public var up(get, never):MockFlxInput;
    public var right(get, never):MockFlxInput;
    public var down(get, never):MockFlxInput;
    public var left(get, never):MockFlxInput;
    public var select(get, never):MockFlxInput;
    public var cancel(get, never):MockFlxInput;
    public var start(get, never):MockFlxInput;

    public var directions(get, never):MockFlxInput;
    public var any(get, never):MockFlxInput;

    public function new() {
        up_ = new MockFlxInput();
        right_ = new MockFlxInput();
        down_ = new MockFlxInput();
        left_ = new MockFlxInput();
        select_ = new MockFlxInput();
        cancel_ = new MockFlxInput();
        start_ = new MockFlxInput();
        directions_ = new MockFlxInput();
        any_ = new MockFlxInput();
    }

    private var up_:MockFlxInput;
    private var right_:MockFlxInput;
    private var down_:MockFlxInput;
    private var left_:MockFlxInput;
    private var select_:MockFlxInput;
    private var cancel_:MockFlxInput;
    private var start_:MockFlxInput;

    private var directions_:MockFlxInput;
    private var any_:MockFlxInput;

    private function get_up()
        return up_;
    private function get_right()
        return right_;
    private function get_down()
        return down_;
    private function get_left()
        return left_;
    private function get_select()
        return select_;
    private function get_cancel()
        return cancel_;
    private function get_start()
        return start_;
    private function get_directions()
        return directions_;
    private function get_any()
        return any_;

}

private class MockFlxInput implements IFlxInput {

    public var stubber:MockStubber;

    public function new() {
        stubber = new MockStubber();
    }

    public var justReleased(get, never):Bool;
    public var released(get, never):Bool;
    public var pressed(get, never):Bool;
    public var justPressed(get, never):Bool;

    public function get_justReleased() {
        return stubber.nextBool("justReleased");
    }
    public function get_released() {
        return stubber.nextBool("released");
    }
    public function get_pressed() {
        return stubber.nextBool("pressed");
    }
    public function get_justPressed() {
        return stubber.nextBool("justPressed");
    }

}