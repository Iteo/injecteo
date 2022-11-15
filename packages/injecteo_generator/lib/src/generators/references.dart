import 'package:code_builder/code_builder.dart';

const injecteoImport = 'package:injecteo/injecteo.dart';

const slTypeReference = Reference('ServiceLocator', injecteoImport);
const slInstanceName = 'serviceLocator';

const slHelperTypeReference = Reference('ServiceLocatorHelper', injecteoImport);
const slHelperInstanceName = 'serviceLocatorHelper';
const slHelperInstanceReference = Reference(slHelperInstanceName);

const registerFactoryFuncName = 'registerFactory';
const registerFactoryAsyncFuncName = 'registerFactoryAsync';

const registerSingletonFuncName = 'registerSingleton';
const registerSingletonAsyncFuncName = 'registerSingletonAsync';

const registerLazySingletonFuncName = 'registerLazySingleton';
const registerLazySingletonAsyncFuncName = 'registerLazySingletonAsync';

const getDependencyAsyncMethodName = '$slInstanceName.getAsync';
const getDependencyMethodName = '$slInstanceName.get';

const baseInjectionModuleTypeReference =
    Reference('BaseInjectionModule', injecteoImport);
const registerDependenciesFuncName = 'registerDependencies';

const environmentParameter = 'environment';
const environmentFilterParameter = 'environmentFilter';
const environmentFilterTypeName = 'EnvironmentFilter';
