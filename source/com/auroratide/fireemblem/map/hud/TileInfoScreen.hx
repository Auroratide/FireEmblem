package com.auroratide.fireemblem.map.hud;

import com.auroratide.fireemblem.text.FontSize;
import com.auroratide.fireemblem.text.Text;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.text.FlxText;
import com.auroratide.fireemblem.hud.Hud;
import com.auroratide.fireemblem.hud.HudAlignment;
import com.auroratide.fireemblem.hud.HudElement;

class TileInfoScreen extends HudElement {

    private var map:FeMap;
    private var cursor:MapCursor;
    private var cursorScreenPosition:FlxPoint;

    private var background:FlxSprite;
    private var nameText:Text;
    private var defText:Text;
    private var avoidText:Text;
    private var hitText:Text;

    private var tile:FeTile;

    public function new(hud:Hud, map:FeMap, cursor:MapCursor, camera:FlxCamera) {
        super(hud);
        this.map = map;
        this.cursor = cursor;
        this.camera = camera;
        this.cursorScreenPosition = new FlxPoint();

        initBackground();
        initText();

        add(background);
        add(nameText);
        add(defText);
        add(avoidText);
        add(hitText);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        updateAlignment();
        updateTileInformation();
    }

    private function updateAlignment():Void {
        cursor.getScreenPosition(cursorScreenPosition, camera);
        if(cursorScreenPosition.x > FlxG.width / 2)
            align(Southwest);
        else
            align(Southeast);
    }

    private function updateTileInformation():Void {
        tile = map.tile(cursor.row, cursor.col);
        if(nameText.text != tile.name()) {
        //  Only update if the tile changed
            nameText.text = tile.name();
            defText.text = Std.string(tile.def());
            avoidText.text = Std.string(tile.avoid());
            hitText.text = Std.string(tile.hit());
        }
    }

    private function initBackground():Void {
        background = new FlxSprite();
        background.loadGraphic(Paths.TILE_INFO);
    }

    private function initText():Void {
        nameText =  new Text(0, 5, background.width, FontSize.MEDIUM, FlxTextAlign.CENTER);
        defText =   new Text(                       0, 30, background.width / 3 - 6, FontSize.SMALL, FlxTextAlign.RIGHT);
        avoidText = new Text(    background.width / 3, 30, background.width / 3 - 6, FontSize.SMALL, FlxTextAlign.RIGHT);
        hitText =   new Text(2 * background.width / 3, 30, background.width / 3 - 6, FontSize.SMALL, FlxTextAlign.RIGHT);
    }

}
