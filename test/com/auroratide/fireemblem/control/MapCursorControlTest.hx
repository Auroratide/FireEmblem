package com.auroratide.fireemblem.control;

import com.auroratide.fireemblem.mock.map.MockMapCursor;
import com.auroratide.fireemblem.mock.input.MockGameInput;
import flixel.FlxSprite;
import flixel.input.IFlxInput;
import com.auroratide.fireemblem.map.MapCursor;
import com.auroratide.fireemblem.input.GameInput;

import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;

class MapCursorControlTest extends Test {

    private var input:MockGameInput;
    private var cursor:MockMapCursor;
    private var control:MapCursorControl;

    override public function setup() {
        input = new MockGameInput();
        cursor = new MockMapCursor();

        control = new MapCursorControl(input, cursor);
    }

    public function testShouldNotMoveWhenNoInputIsPressed() {
        control.update(1);

        verify(cursor, "up", 0);
        verify(cursor, "right", 0);
        verify(cursor, "down", 0);
        verify(cursor, "left", 0);
    }

    public function testShouldMoveUpWhenUpIsPressed() {
        when(input.up, "pressed").then(true);
        control.update(1);

        verify(cursor, "up");
        verify(cursor, "right", 0);
        verify(cursor, "down", 0);
        verify(cursor, "left", 0);
    }

    public function testShouldMoveLeftWhenLeftIsPressed() {
        when(input.left, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", 0);
        verify(cursor, "right", 0);
        verify(cursor, "down", 0);
        verify(cursor, "left");
    }

    public function testShouldMoveDownWhenDownIsPressed() {
        when(input.down, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", 0);
        verify(cursor, "right", 0);
        verify(cursor, "down");
        verify(cursor, "left", 0);
    }

    public function testShouldMoveRightWhenRightIsPressed() {
        when(input.right, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", 0);
        verify(cursor, "right");
        verify(cursor, "down", 0);
        verify(cursor, "left", 0);
    }

    public function testShouldOnlyMoveOnceWhenInputHeldForTwoFrames() {
        when(input.up, "pressed").then(true).then(true);
        when(input.directions, "pressed").then(true).then(true);

        control.update(1);
        control.update(1);

        verify(cursor, "up", 1);
    }

}