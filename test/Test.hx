package;

import haxe.PosInfos;
import com.auroratide.mockit.Arguments;
import com.auroratide.mockit.MockItTestCase;

class Test extends MockItTestCase {

    public static inline var TILESET_PATH = "assets/images/tilesheets/dev.png";

/**
 *  You must use this if you are using Mockatoo in the test.
 *
 *  Actually that's a lie.  You only need this if you are using Mockatoo and the test doesn't have any other asserts.
 */
    function assertMockatoo() {
        assertTrue(true);
    }

    function assertThat(actual:Dynamic, expected:Argument, ?c:PosInfos):Void {
        currentTest.done = true;

        var passed = switch(expected) {
            case Is(e):       actual == e;
            case IsNull:      actual == null;
            case IsNotNull:   actual != null;
            case Contains(e): Lambda.has(actual, e);
            case Matches(r):  r.match(actual);
            case ArgThat(f):  f(actual);
            case Any:         true;
        };

        if (!passed) {
            currentTest.success = false;
            currentTest.error   = 'expected that $actual $expected';
            currentTest.posInfos = c;
            throw currentTest;
        }
    }

}