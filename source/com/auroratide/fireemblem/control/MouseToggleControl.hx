package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import flixel.input.mouse.FlxMouse;
import com.auroratide.fireemblem.input.GameInput;

class MouseToggleControl extends FlxBasic {

    private var input:GameInput;
    private var mouse:FlxMouse;
    private var mouseControls:Iterable<FlxBasic>;

    public function new(input:GameInput, mouse:FlxMouse, mouseControls:Iterable<FlxBasic>) {
        super();
        this.input = input;
        this.mouse = mouse;
        this.mouseControls = mouseControls;
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(input.any.justPressed)
            for(m in mouseControls) m.kill();

        if(mouse.justPressed)
            for(m in mouseControls) m.revive();

    }

}
