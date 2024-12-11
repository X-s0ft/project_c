import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Блок с полями для ввода
            Column(
              children: [
                // Логин
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: screenW * 0.7,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Введите Логин'),
                          maxLength: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                // Пароль
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: screenW * 0.7,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Введите Пароль'),
                          maxLength: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                // Вход
                TextButton(
                  onPressed: () => {dev.log('Войти')},
                  child: const Text('Войти'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
