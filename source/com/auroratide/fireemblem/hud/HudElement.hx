package com.auroratide.fireemblem.hud;

import flixel.group.FlxSpriteGroup;

class HudElement extends FlxSpriteGroup {

    private var hud:Hud;

    public function new(hud:Hud) {
        super();
        this.hud = hud;
    }

    public function align(alignment:HudAlignment):Void {
        var west = hud.x;
        var centX = hud.x + hud.width / 2 - this.width / 2;
        var east = hud.x + hud.width - this.width;
        var north = hud.y;
        var centY  = hud.y + hud.height / 2 - this.height / 2;
        var south = hud.y + hud.height - this.height;

        switch(alignment) {
            case Northwest: this.setPosition(west, north);
            case North:     this.setPosition(centX, north);
            case Northeast: this.setPosition(east, north);
            case West:      this.setPosition(west, centY);
            case Center:    this.setPosition(centX, centY);
            case East:      this.setPosition(east, centY);
            case Southwest: this.setPosition(west, south);
            case South:     this.setPosition(centX, south);
            case Southeast: this.setPosition(east, south);
            case Location(x_, y_): this.setPosition(x_, y_);
        }
    }

}
