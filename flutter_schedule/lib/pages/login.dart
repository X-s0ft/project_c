import 'package:flutter/material.dart';
import '../func/allfunc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    login.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная страница',
        ),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          controller: login,
                          decoration: const InputDecoration(
                              labelText: 'Введите Логин', counterText: ''),
                          maxLength: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: getH(context, 0.1),
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
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Введите Пароль', counterText: ''),
                          maxLength: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: getH(context, 0.1),
                ),

                // Вход
                OutlinedButton(
                  onPressed: () {
                    if (login.text.isNotEmpty && password.text.isNotEmpty) {
                      loginF(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Вы не ввели данные'),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Войти'),
                ),
              ],
            ),

            SizedBox(
              height: getH(context, 0.3),
            ),

            // Проверка страниц
            Wrap(
              children: [
                OutlinedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/AddSchedule')},
                  child: const Text('Добавление расписания'),
                ),
                OutlinedButton(
                  onPressed: () => {Navigator.pushNamed(context, '/Groups')},
                  child: const Text('Группы'),
                ),
                OutlinedButton(
                  onPressed: () => {Navigator.pushNamed(context, '/Registr')},
                  child: const Text('Регистрация'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
