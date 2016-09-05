THIS PROJECT HAS NO AFFILIATION WITH NINTENDO OR INTELLIGENT SYSTEMS.

To run:

```
openfl test PLATFORM
```

To test:

```
openfl test PLATFORM -Ddotest
```

Until I write a macro for detecting test classes or whatever, things are manual.  The TestDriver class is where test cases are registered for testing.  The constructor must be edited for each new test class that is created.  That's all you have to do, so it isn't that hard.  If you only want to test a single case, though, you have to specify it in the main().  Simply comment out the all() and use one() instead, supplying it with the fully qualified class name of the test (eg. com.auroratide.fireemblem.FeMapTest).