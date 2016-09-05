package;

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

}