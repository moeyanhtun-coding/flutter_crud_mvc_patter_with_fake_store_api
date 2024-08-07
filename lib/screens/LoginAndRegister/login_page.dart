import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.greenAccent.shade100,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_margin(0, 20), _loginText(), _textForm()],
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Welcome To Applicaton",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Login To Continue",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _margin(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _textForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      child: Column(
        children: [
          _textField(
            TextInputType.text,
            TextInputAction.next,
            false,
            'Enter Your Name',
            'Username',
            Icons.person,
          )
        ],
      ),
    );
  }

  Widget _textField(TextInputType type, TextInputAction action,
      bool obscureText, String hintText, label, IconData icon) {
    return TextField(
      keyboardType: type,
      textInputAction: action,
      obscureText: obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(label),
        icon: Icon(icon),
      ),
    );
  }
}
