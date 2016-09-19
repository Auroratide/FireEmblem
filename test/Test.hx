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

    function verify(mock:MockedObject, method:String, ?params:Array<Dynamic>, ?times:Times, ?c:PosInfos):Void {
        if(params == null)
            params = [];
        if(times == null)
            times = Exactly(1);
        currentTest.done = true;

        var timesInvoked = mock.verifier.get(method, params);
        if (!switch(times) {
            case Never: 0 == timesInvoked;
            case Exactly(n): n == timesInvoked;
            case AtLeast(n): n <= timesInvoked;
            case AtMost(n): n >= timesInvoked;
        }) {
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