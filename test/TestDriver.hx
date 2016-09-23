package;

import haxe.unit.TestCase;
import haxe.unit.TestRunner;

import com.auroratide.fireemblem.control.*;
import com.auroratide.fireemblem.hud.*;
import com.auroratide.fireemblem.loader.*;
import com.auroratide.fireemblem.map.*;

class TestDriver {

    public static function main():Void {
        var driver = new TestDriver();
//        driver.all();

        driver.some("com.auroratide.fireemblem.control");
        driver.some("com.auroratide.fireemblem.hud");
        driver.some("com.auroratide.fireemblem.loader");

        driver.run();
    }

    private var runner:TestRunner;
    private var tests:Map<String, TestCase>;

    public function new() {
        runner = new TestRunner();
        tests = new Map<String, TestCase>();

        register(new MapCursorControlTest());
        register(new MapCursorMouseControlTest());
        register(new MouseToggleControlTest());

        register(new HudTest());
        register(new HudElementTest());

        register(new FeMapTest());
        register(new FeTilesetTest());
        register(new MapCursorTest());

        register(new MapLoaderTest());
        register(new TilesetLoaderTest());
        register(new TilesheetLoaderTest());
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