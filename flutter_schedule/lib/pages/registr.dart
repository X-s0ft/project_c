import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shedule/func/getwh.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
  final _login = TextEditingController();
  final _password = TextEditingController();

  void createuser() async {
    var ref = FirebaseFirestore.instance.collection("Users");

    ref.add(
        {"Login": _login.text, "Password": _password.text, "IsAdmin": false});
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
          'Регистрация',
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
                                labelText: 'Введите Группу', counterText: ''),
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
                    onPressed: () => {createuser()},
                    child: const Text('Создать пользователя'),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
