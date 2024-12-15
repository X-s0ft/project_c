import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shedule/func/getwh.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void addschedule() async {
    var ref = FirebaseFirestore.instance.collection("schedule");

    ref.add({"Группа": null, "Дата": null, "Расписание": []});
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: []),

                  // Вход
                  OutlinedButton(
                    onPressed: () => {addschedule()},
                    child: const Text('Добавить расписание'),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
