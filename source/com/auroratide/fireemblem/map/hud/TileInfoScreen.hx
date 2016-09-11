package com.auroratide.fireemblem.map.hud;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import com.auroratide.fireemblem.hud.Hud;
import com.auroratide.fireemblem.hud.HudAlignment;
import com.auroratide.fireemblem.hud.HudElement;

class TileInfoScreen extends HudElement {

    private var cursor:MapCursor;
    private var cursorScreenPosition:FlxPoint;

    public function new(hud:Hud, cursor:MapCursor, camera:FlxCamera) {
        super(hud);
        this.cursor = cursor;
        this.camera = camera;
        this.cursorScreenPosition = new FlxPoint();

        var background = new FlxSprite();
        background.loadGraphic(Paths.TILE_INFO);

        add(background);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        cursor.getScreenPosition(cursorScreenPosition, camera);
        if(cursorScreenPosition.x > FlxG.width / 2)
            align(Southwest);
        else
            align(Southeast);
    }

}
