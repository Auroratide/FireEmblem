package com.auroratide.fireemblem.error;

class ParserError extends Error {

    public function new(message:String, ?where:String) {
        super(message, where);
    }

}
