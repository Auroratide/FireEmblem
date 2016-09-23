package com.auroratide.fireemblem.hud;

import flixel.FlxSprite;
import com.auroratide.mockit.Arguments;

class HudElementTest extends Test {

    private var hud:Hud;
    private var element:HudElement;

    override public function setup():Void {
        hud = new Hud(20, 30, 500, 700);
        element = new HudElement(hud);
        var sprite = new FlxSprite();
        sprite.makeGraphic(200, 300);
        element.add(sprite);
    }

    public function testAlignNorth() {
        element.align(North);

        assertThat(element.x, Is(170));
        assertThat(element.y, Is(30));
    }

}