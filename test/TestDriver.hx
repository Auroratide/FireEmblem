package;

import haxe.unit.TestCase;
import haxe.unit.TestRunner;

import com.auroratide.fireemblem.FeMapTest;

class TestDriver {

    public static function main():Void {
        var driver = new TestDriver();
        driver.all();
        driver.run();
    }

    private var runner:TestRunner;
    private var tests:Map<String, TestCase>;

    public function new() {
        runner = new TestRunner();
        tests = new Map<String, TestCase>();
        register(new FeMapTest());
    }

    public function register(test:TestCase):Void {
        tests.set(Type.getClassName(Type.getClass(test)), test);
    }

    public function one(fullyQualifiedName:String):Void {
        runner.add(tests.get(fullyQualifiedName));
    }

    public function all():Void {
        for(test in tests)
            runner.add(test);
    }

    public function run():Bool {
        return runner.run();
    }

}