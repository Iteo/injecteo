A generator for [injecteo].\
Generates `$injecteoConfig` function which setup Service Locator: register factories and singletons for (optional) environment. Then, it generates dependency setup to be used in your project's classes.

Heavily inspired by [injectable], may be a drop-in replacement with only minimal code changes required. 

[injecteo]: https://pub.dev/packages/injecteo
[injectable]: https://pub.dev/packages/injectable