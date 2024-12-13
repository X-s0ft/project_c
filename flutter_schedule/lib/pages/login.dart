import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import '../func/getwh.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usersCollections = FirebaseFirestore.instance;

  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void inputlp() {
    String log = _login.text;
    String pas = _password.text;

    dev.log('$log, $pas');
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = usersCollections.collection('Users');
    final res1 = res.where('Login', isEqualTo: 'admin');
    print(res1);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная страница',
        ),
      ),
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
                        width: getW(context, 0.7),
                        child: TextFormField(
                          controller: _login,
                          decoration: const InputDecoration(
                              labelText: 'Введите Логин', counterText: ''),
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
                        width: getW(context, 0.7),
                        child: TextFormField(
                          controller: _password,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Введите Пароль', counterText: ''),
                          maxLength: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                // Вход
                ElevatedButton(
                  onPressed: () => {print('$_login $_password')},
                  child: const Text('Войти'),
                ),
              ],
            ),
            SizedBox(
              height: getH(context, 0.3),
            ),
            Wrap(
              children: [
                TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/AddOrEdit')},
                  child: const Text('Редактирование/Добавление расписания'),
                ),
                TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/DateData')},
                  child: const Text('Дата данные'),
                ),
                TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/Groups')},
                  child: const Text('Группы'),
                ),
                TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/Registr')},
                  child: const Text('Регистрация'),
                ),
                TextButton(
                  onPressed: () => {inputlp()},
                  child: const Text('Значения'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
