package;

class MethodStub<T> {

    private var returns:Array<ReturnType<T>>;
    private var position:Int;

    public function new() {
        returns = new Array<ReturnType<T>>();
        position = 0;
    }

    public function then(value:T):MethodStub<T> {
        returns.push(Value(value));
        return this;
    }

    public function error(err:Dynamic):MethodStub<T> {
        returns.push(Error(err));
        return this;
    }

    public function always(value:T):MethodStub<T> {
        returns.push(Always(value));
        return this;
    }

    public function next():T {
        if(position >= returns.length)
            return null;

        switch(returns[position]) {
            case Value(v): ++position; return v;
            case Error(e): ++position; throw e;
            case Always(v): return v;
        }
    }

}

private enum ReturnType<T> {
    Value(v:T);
    Error(e:Dynamic);
    Always(v:T);
}