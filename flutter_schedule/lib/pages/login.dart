import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shedule/func/allfunc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void getdata() async {
    try {
      var ref = FirebaseFirestore.instance.collection("Users");

      var getlog = await ref.where("Login", isEqualTo: _login.text).get();
      var getpas = await ref.where("Password", isEqualTo: _password.text).get();
      if (getlog.docs.isNotEmpty && getpas.docs.isNotEmpty) {
        Navigator.pushNamed(context, '/DateData');
      } else {
        
      }
    } catch (e) { await
      AlertDialog(
          title: Text('Произошла ошибка'),
          content: Text('Вы что-то не првильно заполнили'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Ок')),
          ]);
    }
  }

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
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

                SizedBox(
                  height: getH(context, 0.1),
                ),

                // Вход
                OutlinedButton(
                  onPressed: () => {getdata()},
                  child: const Text('Войти'),
                ),
              ],
            ),

            SizedBox(
              height: getH(context, 0.3),
            ),

            Wrap(
              children: [
                OutlinedButton(
                  onPressed: () => {Navigator.pushNamed(context, '/AddSchedule')},
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
