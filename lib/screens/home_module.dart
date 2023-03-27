import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/screens/login_screen.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => LoginScreen()),
        ChildRoute('/home', child: (context, args) => const HomeScreen())
      ];
}
