import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/Widgets/app_module.dart';

import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/screens/login_screen.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const Pokedex(),
    ),
  );
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
