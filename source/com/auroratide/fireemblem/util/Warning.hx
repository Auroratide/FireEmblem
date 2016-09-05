package com.auroratide.fireemblem.util;

class Warning {

    public static inline function warn(message:String, ?when = true):Void {
      #if debug
        if(when) trace(message);
      #end
    }

}