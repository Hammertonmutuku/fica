import 'package:fika/constants/routes.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: isHiddenPassword,
      controller: widget._passwordController,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: kPrimaryColor,
        ),
        suffixIcon: IconButton(
          onPressed: _togglePassword,
          icon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "Password",
        isDense: true,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  void _togglePassword() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}
