import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedule/pages/auth.dart';
import 'package:shedule/pages/login.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Регистрация');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: createUserWithEmailAndPassword,
      child: Text('Зарегестрироваться'),
    );
  }

  Widget _logpage() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: Text('Уже есть аккаунт'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              _entryField('email', _controllerEmail),
              _entryField('password', _controllerPassword),
              _errorMessage(),
              _submitButton(),
              _logpage(),
            ],
          ),
        ),
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Регистрация',
//         ),
//       ),
//       body: Align(
//         alignment: Alignment.center,
//         child: Column(
//           spacing: 20,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: getW(context, 0.7),

//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Введите название группы',
//                   counterText: "",
//                 ),
//                 maxLength: 15,
//               ),
//             ),
//             SizedBox(
//               width: getW(context, 0.7),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Введите пароль',
//                   counterText: "",
//                 ),
//                 maxLength: 15,
//               ),
//             ),
//             OutlinedButton(
//               onPressed: () => {},
//               child: const Text('Зарегестрироваться'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
