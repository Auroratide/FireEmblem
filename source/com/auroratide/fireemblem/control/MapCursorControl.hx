package com.auroratide.fireemblem.control;

import flixel.FlxBasic;
import com.auroratide.fireemblem.input.GameInput;
import com.auroratide.fireemblem.map.MapCursor;

class MapCursorControl extends FlxBasic {

    private static inline var DELAY_HOLD = 18;
    private static inline var DELAY_REPEAT = 3;

    public function new(input:GameInput, cursor:MapCursor) {
        super();
        this.input = input;
        this.cursor = cursor;
        this.holdCounter = 0;
    }

/*  Flixel API
 *  =========================================================================*/
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        if(canMove())
            move();

        updateHoldCounter();
    }

/*  Private Members
 *  =========================================================================*/
    private var input:GameInput;
    private var cursor:MapCursor;
    private var holdCounter:Int;

/*  Private Methods
 *  =========================================================================*/
    private inline function move():Void {
        if(input.up.pressed)
            cursor.up();
        if(input.right.pressed)
            cursor.right();
        if(input.down.pressed)
            cursor.down();
        if(input.left.pressed)
            cursor.left();
    }

    private inline function canMove():Bool {
        return input.cancel.pressed ||
               holdCounter == 0     ||
               (holdCounter > DELAY_HOLD && holdCounter % DELAY_REPEAT == 0);
    }

    private inline function updateHoldCounter():Void {
        if(input.directions.pressed)
            ++holdCounter;
        if(input.directions.released && input.cancel.released)
            holdCounter = 0;
        if(input.cancel.justPressed)
            holdCounter = DELAY_HOLD + (holdCounter % DELAY_REPEAT); // the last bit ensures a smoother transition
    }
}
