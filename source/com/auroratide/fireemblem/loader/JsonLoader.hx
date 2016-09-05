package com.auroratide.fireemblem.loader;

import haxe.Json;

import openfl.Assets;

import com.auroratide.fireemblem.util.Warning;

class JsonLoader<T> implements AssetLoader<T> {

    public var path:String;

    public function new(path:String) {
        this.path = path;
    }

    public function load():T {
        return parse(Json.parse(Assets.getText(path)));
    }

    private function parse(json:Dynamic):T {
        Warning.warn("parse() method not implemented in JsonLoader");
        return json;
    }

}
