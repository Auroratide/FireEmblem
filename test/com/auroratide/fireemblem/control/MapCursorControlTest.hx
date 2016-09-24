package com.auroratide.fireemblem.control;

import com.auroratide.mockit.MockItTestCase;
import com.auroratide.fireemblem.mock.map.MockMapCursor;
import com.auroratide.fireemblem.mock.input.MockGameInput;

@unit class MapCursorControlTest extends Test {

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

        verify(cursor, "up", Zero);
        verify(cursor, "right", Zero);
        verify(cursor, "down", Zero);
        verify(cursor, "left", Zero);
    }

    public function testShouldMoveUpWhenUpIsPressed() {
        when(input.up, "pressed").then(true);
        control.update(1);

        verify(cursor, "up");
        verify(cursor, "right", Zero);
        verify(cursor, "down", Zero);
        verify(cursor, "left", Zero);
    }

    public function testShouldMoveLeftWhenLeftIsPressed() {
        when(input.left, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Zero);
        verify(cursor, "right", Zero);
        verify(cursor, "down", Zero);
        verify(cursor, "left");
    }

    public function testShouldMoveDownWhenDownIsPressed() {
        when(input.down, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Zero);
        verify(cursor, "right", Zero);
        verify(cursor, "down");
        verify(cursor, "left", Zero);
    }

    public function testShouldMoveRightWhenRightIsPressed() {
        when(input.right, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Zero);
        verify(cursor, "right");
        verify(cursor, "down", Zero);
        verify(cursor, "left", Zero);
    }

    public function testShouldOnlyMoveOnceWhenInputHeldForTwoFrames() {
        when(input.up, "pressed").then(true).then(true);
        when(input.directions, "pressed").then(true).then(true);

        control.update(1);
        control.update(1);

        verify(cursor, "up", Exactly(1));
    }

    public function testShouldMoveManyTimesWhenInputIsHeldForALongTime() {
        when(input.up, "pressed").then(true).always();

        for(i in 0...100)
            control.update(1);

        verify(cursor, "up", AtLeast(2));
    }

}