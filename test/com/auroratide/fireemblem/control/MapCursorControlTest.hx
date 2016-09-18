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

    public function testUpdate() {
        var input:GameInput = mockGameInput();
        var cursor = new MockMapCursor();

        cursor.setPosition(1, 1);
        cursor.setPosition(1, 2);

        cursor.stubber.when("row").then(12);
        trace(cursor.row);
        trace(cursor.row);

        verify(cursor, "up", 0);

        //var control = new MapCursorControl(input, cursor);
    }

    private function mockGameInput():GameInput {
        return new MockGameInput(
            mock(IFlxInput), mock(IFlxInput), mock(IFlxInput), mock(IFlxInput),
            mock(IFlxInput), mock(IFlxInput), mock(IFlxInput),
            mock(IFlxInput), mock(IFlxInput)
        );
    }

}