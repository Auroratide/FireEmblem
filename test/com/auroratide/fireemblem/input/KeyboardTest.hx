package com.auroratide.fireemblem.input;

import flixel.input.keyboard.FlxKeyboard;
import com.auroratide.fireemblem.config.Keybinds;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class KeyboardTest extends Test {

    private var flxKeyboard:FlxKeyboard;
    private var keybinds:Keybinds;
    private var keyboard:Keyboard;

    override public function setup() {
        flxKeyboard = mock(FlxKeyboard);
        keybinds = mock(Keybinds);
        keyboard = new Keyboard(flxKeyboard, keybinds);
    }

    public function testUp() {

    }

}