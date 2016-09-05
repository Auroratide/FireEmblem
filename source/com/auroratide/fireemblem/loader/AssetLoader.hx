package com.auroratide.fireemblem.loader;

interface AssetLoader<T> {
    function set(data:String):AssetLoader<T>;
    function load():T;
}
