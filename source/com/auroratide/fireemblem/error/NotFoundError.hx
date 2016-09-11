package com.auroratide.fireemblem.error;
class NotFoundError extends Error {
    public function new(message:String, ?where:String) {
        super(message, where);
    }
}
