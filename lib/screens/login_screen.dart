import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/Widgets/custom_text_form_field.dart';
import 'package:pokedex/models/user_model.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/screens/sign_up_screen.dart';
import 'package:pokedex/stores/login_store.dart';
import 'package:pokedex/values/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginStore loginStore = LoginStore();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'images/pokemon_logo.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                      enabled: !loginStore.loading,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.amber,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.amber, width: 3),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Email'),
                    ),
                  );
                },
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: !loginStore.passwordVisible,
                    onChanged: loginStore.setPassword,
                    enabled: !loginStore.loading,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.amber,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.amber, width: 3),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Senha'),
                  ),
                );
              }),
              Observer(
                builder: (_) {
                  return InkWell(
                    onTap: loginStore.isFormValid
                        ? () {
                            _doLogin();
                            loginStore.login();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext) => const HomeScreen(),
                              ),
                            );
                          }
                        : null,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: loginStore.loading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text(
                                "Login",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: GestureDetector(
                    child: const Text('A new gym Trainer? Sign up instead'),
                    onTap: () {
                      // print('Nav to Sign Up');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUpScreen(),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = this._emailController.text;
    String passForm = this._passwordController.text;

    User savedUser = await _getSavedUser();
    print(savedUser);
  }

  Future<User> _getSavedUser() async {
    var prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString(PreferencesKeys.activeUser);

    if (jsonUser != null) {
      Map<String, dynamic> mapUser = json.decode(jsonUser);
      User user = User.fromJson(mapUser as String);
      return user;
    } else {
      return User(
          name: "",
          mail: _emailController.text,
          password: _passwordController.text);
    }
  }
}
