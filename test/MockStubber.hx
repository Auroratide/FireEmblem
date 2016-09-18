package;

class MockStubber {

    private var methods:Map<String, MethodStub<Dynamic>>;

    public function new() {
        methods = new Map<String, MethodStub<Dynamic>>();
    }

    public function when<T>(name:String):MethodStub<T> {
        var stub = new MethodStub<T>();
        methods.set(name, stub);
        return stub;
    }

    public function next(name:String):Dynamic {
        if(!methods.exists(name))
            return null;
        return methods.get(name).next();
    }

    public function nextInt(name:String):Int {
        var n = next(name);
        return n == null ? 0 : n;
    }

    public function nextFloat(name:String):Float {
        var x = next(name);
        return x == null ? 0.0 : x;
    }

    public function nextBool(name:String):Bool {
        var b = next(name);
        return b == null ? false : b;
    }

}

private class MethodStub<T> {

    private var returns:Array<T>;
    private var position:Int;

    public function new() {
        returns = new Array<T>();
        position = 0;
    }

    public function then(value:T):MethodStub<T> {
        returns.push(value);
        return this;
    }

    public function next():T {
        if(position >= returns.length)
            return null;
        return returns[position++];
    }

}