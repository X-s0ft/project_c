import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Data',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Data',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Data',
              style: TextStyle(fontFamily: 'Ubuntu', fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
