import 'package:flutter/material.dart';
import 'package:pokedex/Widgets/custom_text_form_field.dart';
import 'package:pokedex/models/user_model.dart';

import 'package:pokedex/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset(
            'images/pokemon_logo.png',
            width: 300,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: _nameController,
            hintText: "Name",
            obscureText: false,
            icon: Icons.person,
          ),
          CustomTextFormField(
            controller: _emailController,
            hintText: "Email",
            obscureText: false,
            icon: Icons.email,
          ),
          CustomTextFormField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
              icon: Icons.lock),
          InkWell(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "SignUp",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            onTap: () {
              _doSignUp();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext) => const HomeScreen()));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: GestureDetector(
              child: const Text('Already a gym trainer? Login instead instead'),
              onTap: () {
                print('Nav to Sign Up');
              },
            )),
          )
        ],
      )),
    );
  }

  void _doSignUp() {
    User newUser = User(
      user: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      keepOn: true,
    );

    print(newUser);
  }
}
