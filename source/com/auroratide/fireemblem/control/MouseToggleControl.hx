package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.mouse.FlxMouse;
import com.auroratide.fireemblem.input.Keyboard;
import com.auroratide.fireemblem.config.Keybinds;

class MouseToggleControl extends FlxBasic {

    private var keyboard:Keyboard;
    private var mouse:FlxMouse;
    private var mouseControls:Iterable<FlxBasic>;

    public function new(keyboard:Keyboard, mouse:FlxMouse, mouseControls:Iterable<FlxBasic>) {
        super();
        this.keyboard = keyboard;
        this.mouse = mouse;
        this.mouseControls = mouseControls;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(keyboard.any.justPressed)
            for(m in mouseControls) m.kill();

        if(mouse.justPressed)
            for(m in mouseControls) m.revive();

    }

}
