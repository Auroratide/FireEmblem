package com.auroratide.fireemblem.loader;

/**
 *  Used to load assets for the game.
 */
interface AssetLoader<T> {
/**
 *  Used to determine which asset to load.
 *  @param data Whatever data is needed to find the asset
 *  @return This AssetLoader, so it can be chained with load()
 */
    function set(data:String):AssetLoader<T>;

/**
 *  Loads the asset and returns it.
 */
    function load():T;
}
