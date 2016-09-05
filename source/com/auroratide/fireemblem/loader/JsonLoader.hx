package com.auroratide.fireemblem.loader;

import haxe.Json;
import openfl.Assets;
import com.auroratide.fireemblem.util.Warning;

/**
 *  This class is used to load Json assets.  Extend this class and override
 *  the parse() method in order to use this.
 */
class JsonLoader<T> implements AssetLoader<T> {

/*  Constructor
 *  =========================================================================*/
    public function new(path:String) {
        this.path = path;
    }

/*  Public Methods
 *  =========================================================================*/
/**
 *  @inheritDoc
 */
    public function set(path:String):AssetLoader<T> {
        this.path = path;
        return this;
    }

/**
 *  @inheritDoc
 */
    public function load():T {
        return parse(Json.parse(Assets.getText(path)));
    }

/*  Private Members
 *  =========================================================================*/
    private var path:String;

/*  Private Methods
 *  =========================================================================*/
/**
 *  @private
 *  Takes the raw Json data and turns it into the desired object.
 *  @param json Raw Json structured data
 *  @return The loaded asset
 */
    private function parse(json:Dynamic):T {
        Warning.warn("parse() method not implemented in JsonLoader");
        return json;
    }

}
