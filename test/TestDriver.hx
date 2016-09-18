package;

import com.auroratide.fireemblem.control.MapCursorControlTest;
import com.auroratide.fireemblem.map.FeTilesetTest;
import haxe.unit.TestCase;
import haxe.unit.TestRunner;

import com.auroratide.fireemblem.map.*;
import com.auroratide.fireemblem.loader.MapLoaderTest;

class TestDriver {

    public static function main():Void {
        var driver = new TestDriver();
//        driver.all();

        driver.one("com.auroratide.fireemblem.control.MapCursorControlTest");

        driver.run();
    }

    private var runner:TestRunner;
    private var tests:Map<String, TestCase>;

    public function new() {
        runner = new TestRunner();
        tests = new Map<String, TestCase>();

        register(new MapCursorControlTest());

        register(new FeMapTest());
        register(new FeTilesetTest());
        register(new MapCursorTest());

        register(new MapLoaderTest());
    }

    public function register(test:TestCase):Void {
        tests.set(Type.getClassName(Type.getClass(test)), test);
    }

    public function one(fullyQualifiedName:String):Void {
        runner.add(tests.get(fullyQualifiedName));
    }

    public function some(packageName:String):Void {
        for(name in tests.keys())
            if(name.indexOf(packageName) >= 0)
                runner.add(tests.get(name));
    }

    public function all():Void {
        for(test in tests)
            runner.add(test);
    }

    public function run():Bool {
        return runner.run();
    }

}