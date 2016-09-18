package;

/**
 *  To use this, make a public variable called tracker in the mock
 */
class MockVerifier {

    private var methods:Map<String, Array<Array<Dynamic>>>;

    public function new() {
        methods = new Map<String, Array<Array<Dynamic>>>();
    }

    public function get(name:String, params:Array<Dynamic>, times = 1):Int {
        if(!methods.exists(name))
            return 0;

        return Lambda.count(methods.get(name), function(actual) {
            return matchParams(params, actual);
        });
    }

    public function set(name:String, params:Array<Dynamic>):Void {
        if(!methods.exists(name))
            methods.set(name, new Array<Array<Dynamic>>());

        methods.get(name).push(params);
    }

    private function matchParams(expected:Array<Dynamic>, actual:Array<Dynamic>):Bool {
        if(expected.length != actual.length)
            return false;

        for(i in 0...expected.length) {
            if(expected[i] != actual[i])
                return false;
        }

        return true;
    }

}