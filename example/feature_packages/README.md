# Example how to use feature packages

This example shows how to register multiple dependnecies coming from separate packages. Imagine a scenario you would like to features into separate libraries, in order to reuse them in different projects. 

# Melos
Repository assumes you have Melos configured and running. Refer to documentation in case of help necessary [Melos](https://melos.invertase.dev)

## Run Melos bootstrap
    melos bs

## Run Melos get and generate
    melos run get
    melos run generate

# Project structure

Have a look at `di.dart` file in root folder. Here is the place where magic happens. `registerDependencies` registers dependencies from two feature packages called `logger` and `counter`. 

Feature packages export own `registerDependencies` methods with different names:
- `registerCounterDependencies()`
- `registerLoggerDependencies()`
  
 You need to call them, optionally pass an application `environment` e.g `dev` or `prod`. 

 # Alternative way of InjectionModule register

 There is an alternative way, how you can register `InjectionModule`. The only thing you need to call is `YourInjectionModule.registerDependencies()` method. 
 
 You can use that way if you conditionally need / do not need some modules in the application. 