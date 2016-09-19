package com.auroratide.fireemblem.control;

import Times;

import com.auroratide.fireemblem.mock.map.MockMapCursor;
import com.auroratide.fireemblem.mock.input.MockGameInput;

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

        verify(cursor, "up", Never);
        verify(cursor, "right", Never);
        verify(cursor, "down", Never);
        verify(cursor, "left", Never);
    }

    public function testShouldMoveUpWhenUpIsPressed() {
        when(input.up, "pressed").then(true);
        control.update(1);

        verify(cursor, "up");
        verify(cursor, "right", Never);
        verify(cursor, "down", Never);
        verify(cursor, "left", Never);
    }

    public function testShouldMoveLeftWhenLeftIsPressed() {
        when(input.left, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Never);
        verify(cursor, "right", Never);
        verify(cursor, "down", Never);
        verify(cursor, "left");
    }

    public function testShouldMoveDownWhenDownIsPressed() {
        when(input.down, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Never);
        verify(cursor, "right", Never);
        verify(cursor, "down");
        verify(cursor, "left", Never);
    }

    public function testShouldMoveRightWhenRightIsPressed() {
        when(input.right, "pressed").then(true);
        control.update(1);

        verify(cursor, "up", Never);
        verify(cursor, "right");
        verify(cursor, "down", Never);
        verify(cursor, "left", Never);
    }

    public function testShouldOnlyMoveOnceWhenInputHeldForTwoFrames() {
        when(input.up, "pressed").then(true).then(true);
        when(input.directions, "pressed").then(true).then(true);

        control.update(1);
        control.update(1);

        verify(cursor, "up", Exactly(1));
    }

    public function testShouldMoveManyTimesWhenInputIsHeldForALongTime() {
        when(input.up, "pressed").always(true);

        for(i in 0...100)
            control.update(1);

        verify(cursor, "up", AtLeast(2));
    }

}