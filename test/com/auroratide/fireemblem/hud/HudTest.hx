package com.auroratide.fireemblem.hud;

import com.auroratide.mockit.Arguments;
import flixel.group.FlxSpriteGroup;

class HudTest extends Test {

    public function testShouldRemoveScrollFactorWhenAdding() {
        var hud = new Hud(0, 0, 0, 0);
        var group = new FlxSpriteGroup();

        hud.add(group);

        assertThat(group.scrollFactor.x, Is(0.0));
        assertThat(group.scrollFactor.y, Is(0.0));
    }

}