package com.auroratide.fireemblem.error;
class IllegalArgumentError extends Error {

    public function new(message:String, ?where:String) {
        super(message, where);
    }

}
