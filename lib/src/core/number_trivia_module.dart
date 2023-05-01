import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

class NumberTriviaModule extends Module {
  @override
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: NumberTriviaModule()),
      ];
}
