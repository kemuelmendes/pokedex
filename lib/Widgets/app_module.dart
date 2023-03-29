import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/screens/home_module.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/screens/login_screen.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ChildRoute('/loginpag', child: (context, args) => LoginScreen())
      ];
}
