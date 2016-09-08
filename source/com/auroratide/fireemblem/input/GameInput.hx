package com.auroratide.fireemblem.input;

import flixel.input.IFlxInput;

interface GameInput {
    public var up(get, never):IFlxInput;
    public var right(get, never):IFlxInput;
    public var down(get, never):IFlxInput;
    public var left(get, never):IFlxInput;

    public var directions(get, never):IFlxInput;
    public var any(get, never):IFlxInput;
}
