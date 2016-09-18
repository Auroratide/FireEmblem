package com.auroratide.fireemblem.map;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class MapBorder extends FlxGroup {

    public function new() {  super(); }

    public static function create(thickness:Int, color:FlxColor, map:FeMap):MapBorder {
        var top = new FlxSprite();
        top.setPosition(map.bounds.left - thickness, map.bounds.top - thickness);
        top.makeGraphic(Std.int(map.bounds.width) + thickness, thickness, color);

        var right = new FlxSprite();
        right.setPosition(map.bounds.right, map.bounds.top - thickness);
        right.makeGraphic(thickness, Std.int(map.bounds.height) + thickness, color);

        var bottom = new FlxSprite();
        bottom.setPosition(map.bounds.left - thickness, map.bounds.bottom);
        bottom.makeGraphic(Std.int(map.bounds.width) + 2 * thickness, thickness, color);

        var left = new FlxSprite();
        left.setPosition(map.bounds.left - thickness, map.bounds.top - thickness);
        left.makeGraphic(thickness, Std.int(map.bounds.height) + thickness, color);

        var border = new MapBorder();
        border.add(top);
        border.add(right);
        border.add(bottom);
        border.add(left);

        return border;
    }

}
