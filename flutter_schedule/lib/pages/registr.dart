import 'package:flutter/material.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
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
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300, //ЗАМЕНИТЬ
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Введите название группы',
                  counterText: "",
                ),
                maxLength: 15,
              ),
            ),
            SizedBox(
              width: 300, //ЗАМЕНИТЬ
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Введите пароль',
                  counterText: "",
                ),
                maxLength: 15,
              ),
            ),
            OutlinedButton(
              onPressed: () => {},
              child: const Text('Зарегестрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
