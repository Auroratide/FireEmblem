package com.auroratide.fireemblem.input;

import flixel.input.keyboard.FlxKeyboard;
import flixel.input.IFlxInput;
import com.auroratide.fireemblem.config.Keybinds;

class Keyboard {

    public var up(default, null):IFlxInput;
    public var right(default, null):IFlxInput;
    public var down(default, null):IFlxInput;
    public var left(default, null):IFlxInput;

    public var directions(default, null):IFlxInput;
    public var any(default, null):IFlxInput;

    public function new(flxKeyboard:FlxKeyboard, keybinds:Keybinds) {
        up = new KeyboardInput(flxKeyboard, keybinds.up);
        right = new KeyboardInput(flxKeyboard, keybinds.right);
        down = new KeyboardInput(flxKeyboard, keybinds.down);
        left = new KeyboardInput(flxKeyboard, keybinds.left);

        directions = new KeyboardInput(flxKeyboard,
            keybinds.up
              .concat(keybinds.right)
              .concat(keybinds.down)
              .concat(keybinds.left)
        );

        any = new KeyboardInput(flxKeyboard,
            keybinds.up
              .concat(keybinds.right)
              .concat(keybinds.down)
              .concat(keybinds.left)
        );
    }

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
