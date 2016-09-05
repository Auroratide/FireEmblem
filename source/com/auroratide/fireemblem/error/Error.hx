package com.auroratide.fireemblem.error;

class Error {

    public var message(default, null):String;

    public function new(message:String, ?where:String) {
      #if debug
        if(where != null)
            message += ' (in $where)';
      #end

        this.message = message;
    }
}
