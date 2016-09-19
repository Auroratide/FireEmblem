package;

import haxe.PosInfos;
import haxe.unit.TestCase;

class Test extends TestCase {

    public static inline var TILESET_PATH = "assets/images/tilesheets/dev.png";

/**
 *  You must use this if you are using Mockatoo in the test.
 *
 *  Actually that's a lie.  You only need this if you are using Mockatoo and the test doesn't have any other asserts.
 */
    function assertMockatoo() {
        assertTrue(true);
    }

    function verify(mock:MockedObject, method:String, ?params:Array<Dynamic>, times = 1, ?c:PosInfos):Void {
        if(params == null)
            params = [];
        currentTest.done = true;
        if (times != mock.verifier.get(method, params)){
            currentTest.success = false;
            currentTest.error   = 'expected $times invocations of $method but got ${mock.verifier.get(method, params)}';
            currentTest.posInfos = c;
            throw currentTest;
        }
    }

    function when<T>(stub:StubbedObject, method:String):MethodStub<T> {
        return stub.stubber.when(method);
    }

}

private typedef MockedObject = {
    var verifier:MockVerifier;
}

private typedef StubbedObject = {
    var stubber:MockStubber;
}