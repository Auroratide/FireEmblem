package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.mouse.FlxMouse;
import flixel.input.keyboard.FlxKeyboard;
import com.auroratide.fireemblem.config.Keybinds;

class MouseToggleControl extends FlxBasic {

    private var keyboard:FlxKeyboard;
    private var mouse:FlxMouse;
    private var keybinds:Keybinds;
    private var mouseControls:Iterable<FlxBasic>;

    public function new(keyboard:FlxKeyboard, mouse:FlxMouse, keybinds:Keybinds, mouseControls:Iterable<FlxBasic>) {
        super();
        this.keyboard = keyboard;
        this.mouse = mouse;
        this.keybinds = keybinds;
        this.mouseControls = mouseControls;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(keyboard.anyJustPressed(keybinds.all))
            for(m in mouseControls) m.kill();

        if(mouse.justPressed)
            for(m in mouseControls) m.revive();

    }

}
