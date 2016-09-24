package com.auroratide.fireemblem.control;

import com.auroratide.fireemblem.mock.input.MockGameInput;
import com.auroratide.fireemblem.mock.flixel.MockFlxBasic;
import com.auroratide.fireemblem.mock.flixel.input.mouse.MockFlxMouse;

@unit class MouseToggleControlTest extends Test {

    private var input:MockGameInput;
    private var mouse:MockFlxMouse;
    private var mouseControls:Array<MockFlxBasic>;
    private var control:MouseToggleControl;

    override public function setup():Void {
        input = new MockGameInput();
        mouse = new MockFlxMouse();
        mouseControls = new Array<MockFlxBasic>();
        mouseControls.push(new MockFlxBasic());
        mouseControls.push(new MockFlxBasic());

        control = new MouseToggleControl(input, mouse, mouseControls);
    }

    public function testShouldKillProcessesWhenKeyboardUsed() {
        when(input.any, "justPressed").then(true);

        control.update(1);

        verify(mouseControls[0], "kill");
        verify(mouseControls[1], "kill");
    }

    public function testShouldReviveProcessesWhenMouseUsed() {
        when(mouse, "justPressed").then(true);

        control.update(1);

        verify(mouseControls[0], "revive");
        verify(mouseControls[1], "revive");
    }

}