import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/core/number_trivia_module.dart';
import 'package:realm/realm.dart';
import 'package:number_trivia/src/shared/services/realm_config.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        NumberTriviaModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: NumberTriviaModule()),
      ];
}
