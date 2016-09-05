package com.auroratide.fireemblem.loader;

import com.auroratide.fireemblem.map.FeTileset;

class TilesetLoader extends JsonLoader<FeTileset> {

    private var cache:Map<String, FeTileset>;

    public function new(name:String) {
        super(buildPath(name));
        cache = new Map<String, FeTileset>();
    }

    override public function set(name:String):AssetLoader<FeTileset> {
        return super.set(buildPath(name));
    }

    override private function parse(json:Dynamic):FeTileset {
        if(cache.exists(path))
            return cache.get(path);

        var tilesetData:Array<TilesetStructure> = json;

        var names = new Array<String>();
        var idles = new Array<Array<Array<Int>>>();

        for(tileType in tilesetData) {
            names.push(tileType.name);
            idles.push(tileType.idle);
        }

        var tileset = new FeTileset(names, idles);
        cache.set(path, tileset);

        return tileset;
    }

    private function buildPath(name:String):String {
        return Paths.TILESET + name + ".json";
    }

}

private typedef TilesetStructure = {
    var name:String;
    var idle:Array<Array<Int>>;
}