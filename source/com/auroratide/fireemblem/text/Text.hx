package com.auroratide.fireemblem.text;

import flixel.text.FlxText;

class Text extends FlxText {

    public function new(x = 0.0, y = 0.0, width = 0.0, size:FontSize = 18, ?alignment:FlxTextAlign = "left", ?text = "") {
        super(x, y, width, text, size);
        setFormat(Paths.STANDARD_FONT, size, Colors.TEXT, alignment);
    }

}
