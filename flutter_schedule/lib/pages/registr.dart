import 'package:flutter/material.dart';
import '../func/allfunc.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
  @override
  void dispose() {
    reglogin.dispose();
    regpassword.dispose();
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
                            controller: reglogin,
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
                            controller: regpassword,
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
                      if (reglogin.text.isNotEmpty &&
                          regpassword.text.isNotEmpty) {
                        createuserF(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Пользователь успешно создан'),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Вы не заполнили поля'),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text('Создать пользователя'),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
