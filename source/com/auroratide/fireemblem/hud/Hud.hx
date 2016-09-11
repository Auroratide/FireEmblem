package com.auroratide.fireemblem.hud;

import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;

class Hud extends FlxTypedGroup<FlxSpriteGroup> {

    public var x(default, null):Float;
    public var y(default, null):Float;
    public var width(default, null):Int;
    public var height(default, null):Int;

    public function new(x:Float, y:Float, width:Int, height:Int) {
        super();
        this.x = x;
        this.y = y;
        this.width = width;
        this.height= height;
    }

    override public function add(object:FlxSpriteGroup):FlxSpriteGroup {
        object.scrollFactor.x = 0;
        object.scrollFactor.y = 0;
        return super.add(object);
    }

}