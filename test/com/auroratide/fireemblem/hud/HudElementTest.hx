package com.auroratide.fireemblem.hud;

import flixel.FlxSprite;
import com.auroratide.mockit.Arguments;

@unit class HudElementTest extends Test {

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

    public function testAlignEast() {
        element.align(East);

        assertThat(element.x, Is(320));
        assertThat(element.y, Is(230));
    }

    public function testAlignSouth() {
        element.align(South);

        assertThat(element.x, Is(170));
        assertThat(element.y, Is(430));
    }

    public function testAlignWest() {
        element.align(West);

        assertThat(element.x, Is(20));
        assertThat(element.y, Is(230));
    }

    public function testAlignNorthwest() {
        element.align(Northwest);

        assertThat(element.x, Is(20));
        assertThat(element.y, Is(30));
    }

    public function testAlignNortheast() {
        element.align(Northeast);

        assertThat(element.x, Is(320));
        assertThat(element.y, Is(30));
    }

    public function testAlignSoutheast() {
        element.align(Southeast);

        assertThat(element.x, Is(320));
        assertThat(element.y, Is(430));
    }

    public function testAlignSouthwest() {
        element.align(Southwest);

        assertThat(element.x, Is(20));
        assertThat(element.y, Is(430));
    }

    public function testAlignCenter() {
        element.align(Center);

        assertThat(element.x, Is(170));
        assertThat(element.y, Is(230));
    }

    public function testAlignLocation() {
        element.align(Location(47, 52));

        assertThat(element.x, Is(47));
        assertThat(element.y, Is(52));
    }

}