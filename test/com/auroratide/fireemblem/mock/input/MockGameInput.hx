package com.auroratide.fireemblem.mock.input;

import flixel.input.IFlxInput;
import com.auroratide.fireemblem.input.GameInput;

class MockGameInput implements GameInput {

    public var up(get, never):IFlxInput;
    public var right(get, never):IFlxInput;
    public var down(get, never):IFlxInput;
    public var left(get, never):IFlxInput;
    public var select(get, never):IFlxInput;
    public var cancel(get, never):IFlxInput;
    public var start(get, never):IFlxInput;

    public var directions(get, never):IFlxInput;
    public var any(get, never):IFlxInput;

    public function new(up:IFlxInput, right:IFlxInput, down:IFlxInput, left:IFlxInput,
                        select:IFlxInput, cancel:IFlxInput, start:IFlxInput,
                        directions:IFlxInput, any:IFlxInput) {
        up_ = up; right_ = right; down_ = down; left_ = left;
        select_ = select; cancel_ = cancel; start_ = start;
        directions_ = directions; any_ = any;
    }

    private var up_:IFlxInput;
    private var right_:IFlxInput;
    private var down_:IFlxInput;
    private var left_:IFlxInput;
    private var select_:IFlxInput;
    private var cancel_:IFlxInput;
    private var start_:IFlxInput;

    private var directions_:IFlxInput;
    private var any_:IFlxInput;

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