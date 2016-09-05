package com.auroratide.fireemblem.loader;

import com.auroratide.fireemblem.map.FeTile;
import com.auroratide.fireemblem.map.FeTilesheet;
import flixel.FlxSprite;

import com.auroratide.fireemblem.map.FeMap;
import com.auroratide.fireemblem.map.FeTileset;
import com.auroratide.fireemblem.error.ParserError;

class MapLoader extends JsonLoader<FeMap> {

    private var tilesetLoader:AssetLoader<FeTileset>;
    private var tilesheetLoader:AssetLoader<FeTilesheet>;

    public function new(chapter:Int, tilesetLoader:AssetLoader<FeTileset>, tilesheetLoader:AssetLoader<FeTilesheet>) {
        super(buildPath(chapter));
        this.tilesetLoader = tilesetLoader;
        this.tilesheetLoader = tilesheetLoader;
    }

    override public function set(chapter:String):AssetLoader<FeMap> {
        return super.set(buildPath(Std.parseInt(chapter)));
    }

    override private function parse(json:Dynamic):FeMap {
        var mapData:MapStructure = json;
        validateDimensions(mapData);

        var tilesheet = tilesheetLoader.set(mapData.tilesheet).load();
        var tileset = tilesetLoader.set(mapData.tileset).load();

        var tiles = new Array<FeTile>();
        var numTiles = mapData.rows * mapData.cols;
        for(i in 0...numTiles)
            tiles.push(tileset.get(mapData.tiles[i], mapData.idles[i], tilesheet));

        return FeMap.create(mapData.rows, mapData.cols, tiles);
    }

    private function validateDimensions(data:MapStructure):Void {
        var numTiles = data.rows * data.cols;
        if(numTiles != data.tiles.length || numTiles != data.idles.length)
            throw new ParserError('Could not parse map from $path due to mismatch in dimensions.  Map should have $numTiles tiles but has ${data.tiles.length} tiles and ${data.idles.length} idles', "MapLoader parse");
    }

    private function buildPath(chapter:Int):String {
        var buf = new StringBuf();
        buf.add(Paths.CHAPTER);
        if(chapter < 10)
            buf.add("0");
        buf.add(Std.string(chapter));
        buf.add("/");
        buf.add(Paths.MAP);
        return buf.toString();
    }

}

private typedef MapStructure = {
    var rows:Int;
    var cols:Int;
    var tileset:String;
    var tilesheet:String;
    var tiles:Array<Int>;
    var idles:Array<Int>;
}