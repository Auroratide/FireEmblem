package com.auroratide.fireemblem.input;

import flixel.input.keyboard.FlxKeyboard;
import flixel.input.IFlxInput;
import com.auroratide.fireemblem.config.Keybinds;

class Keyboard implements GameInput {

    public var up(get, never):IFlxInput;
    public var right(get, never):IFlxInput;
    public var down(get, never):IFlxInput;
    public var left(get, never):IFlxInput;

    public var directions(get, never):IFlxInput;
    public var any(get, never):IFlxInput;

    public function new(flxKeyboard:FlxKeyboard, keybinds:Keybinds) {
        up_ = new KeyboardInput(flxKeyboard, keybinds.up);
        right_ = new KeyboardInput(flxKeyboard, keybinds.right);
        down_ = new KeyboardInput(flxKeyboard, keybinds.down);
        left_ = new KeyboardInput(flxKeyboard, keybinds.left);

        directions_ = new KeyboardInput(flxKeyboard,
            keybinds.up
              .concat(keybinds.right)
              .concat(keybinds.down)
              .concat(keybinds.left)
        );

        any_ = new KeyboardInput(flxKeyboard,
            keybinds.up
              .concat(keybinds.right)
              .concat(keybinds.down)
              .concat(keybinds.left)
        );
    }

    private var up_:IFlxInput;
    private var right_:IFlxInput;
    private var down_:IFlxInput;
    private var left_:IFlxInput;

    private var directions_:IFlxInput;
    private var any_:IFlxInput;

    private function get_up():IFlxInput
        return up_;
    private function get_right():IFlxInput
        return right_;
    private function get_down():IFlxInput
        return down_;
    private function get_left():IFlxInput
        return left_;
    private function get_directions():IFlxInput
        return directions_;
    private function get_any():IFlxInput
        return any_;

}

private class KeyboardInput implements IFlxInput {

    public var justReleased(get, never):Bool;
    public var released(get, never):Bool;
    public var pressed(get, never):Bool;
    public var justPressed(get, never):Bool;

    private var keyboard:FlxKeyboard;
    private var keys:Array<Int>;

    public function new(keyboard:FlxKeyboard, keys:Array<Int>) {
        this.keyboard = keyboard;
        this.keys= keys;
    }

    private function get_justReleased():Bool
        return keyboard.anyJustPressed(keys);

    private function get_released():Bool
        return !pressed && !justPressed;

    private function get_pressed():Bool
        return keyboard.anyPressed(keys);

    private function get_justPressed():Bool
        return keyboard.anyJustPressed(keys);

}
