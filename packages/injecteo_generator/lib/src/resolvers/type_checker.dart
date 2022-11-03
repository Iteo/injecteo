import 'package:injecteo_annotation/injecteo_annotation.dart';
import 'package:source_gen/source_gen.dart';

const TypeChecker injectChecker = TypeChecker.fromRuntime(Inject);
const TypeChecker singletonChecker = TypeChecker.fromRuntime(Singleton);
const TypeChecker lazySingletonChecker = TypeChecker.fromRuntime(LazySingleton);

const TypeChecker namedChecker = TypeChecker.fromRuntime(Named);
const TypeChecker environemntChecker = TypeChecker.fromRuntime(Environment);
const TypeChecker disposeMethodChecker = TypeChecker.fromRuntime(DisposeMethod);

const TypeChecker factoryMethodChecker = TypeChecker.fromRuntime(FactoryMethod);
const TypeChecker preResolveChecker = TypeChecker.fromRuntime(PreResolve);

const TypeChecker moduleChecker = TypeChecker.fromRuntime(Module);
