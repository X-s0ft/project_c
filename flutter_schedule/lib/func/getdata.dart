import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final login = TextEditingController();
final password = TextEditingController();

final reglogin = TextEditingController();
final regpassword = TextEditingController();

void createuserF(BuildContext context) async {
  try {
    var ref = FirebaseFirestore.instance.collection(reglogin.text);
    ref.add({
      "Login": reglogin.text,
      "Password": regpassword.text,
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Произошла критическая ошибка'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}

void loginF(BuildContext context) async {
  try {
    var ref = FirebaseFirestore.instance.collection(login.text);

    var getlog = await ref.where("Login", isEqualTo: login.text).get();
    var getpas = await ref.where("Password", isEqualTo: password.text).get();

    if (getlog.docs.isNotEmpty && getpas.docs.isNotEmpty) {
      Navigator.pushNamed(context, '/DateData', arguments: login.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Извините не верные данные'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Произошла критическая ошибка'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}

