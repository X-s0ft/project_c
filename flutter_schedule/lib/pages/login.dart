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
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final docRef = db.collection("Users").doc("Cd3d8ehI2rzXSuQZsRJr");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 200, 227),
        title: const Text(
          'Главная страница',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
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
                  onPressed: () => {dev.log('Войти')},
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
                  onPressed: () => {Navigator.pushNamed(context, '/AddOrEdit')},
                  child: const Text('Редактирование/Добавление расписания'),
                ),
                OutlinedButton(
                  onPressed: () => {Navigator.pushNamed(context, '/DateData')},
                  child: const Text('Дата данные'),
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
