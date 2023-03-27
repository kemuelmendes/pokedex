import 'package:flutter/material.dart';
import 'package:pokedex/Widgets/coloured_pokeball.dart';
import 'package:pokedex/stores/login_store.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.amber,
          ),
          suffixIcon: const ColouredPokeball(
              color: Colors.amber, width: 20, opacity: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.amber, width: 3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 3),
          ),
        ),
      ),
    );
  }
}
