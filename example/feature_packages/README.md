# Example how to use feature packages

This example shows how to register multiple dependnecies coming from separate packages. Imagine a scenario you would like to features into separate libraries, in order to reuse them in different projects. 

# Melos
Repository assumes you have Melos configured and running. Refer to documentation in case of help necessary [Melos](https://melos.invertase.dev)

## Run Melos bootstrap
    melos bs

## Run Melos get and generate
    melos run get
    melos run generate


 # Register Injection Module

 The only thing you need to call is `YourInjectionModule.registerDependencies()` method. Each feature package may export own InjectionModule, you only need to register them before first access. 
 
 You can use this way of dependency registration if you conditionally need / do not need some modules in the application. 

# Alternative way
There is an alternative way to register dependencies you are already familiar with. Each package exports own `registerDependencies` method, which takes Service Locator instance and environment. In our case, feature packages called `logger` and `counter` export following functions:
- `registerCounterDependencies()`
- `registerLoggerDependencies()`
  
 You need to call the functions in `main`, optionally pass an application `environment` e.g `dev` or `prod`. 

```dart
void registerDependnecies() {
    registerCounterDependencies('dev');
    registerLoggerDependencies('dev');
}
```