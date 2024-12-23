import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DateData extends StatefulWidget {
  const DateData({super.key});

  @override
  State<DateData> createState() => _DateDataState();
}

class _DateDataState extends State<DateData> {
  @override
  Widget build(BuildContext context) {
    String argument = ModalRoute.of(context)!.settings.arguments
        as String; // Аргумент на профиль с прошлой страницы

    void getdate_data() async {
      try {
        CollectionReference ref =
            FirebaseFirestore.instance.collection(argument);

        QuerySnapshot collref = await ref.get();

        for (DocumentSnapshot doc in collref.docs) {
          var datedoc = doc['Date'];
          var scheduledoc = doc['Schedule'];

          print('$datedoc, $scheduledoc');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ой, что-то пошло не так'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Дата',
        ),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  getdate_data();
                },
                child: Text('Нажми протестить'))
          ],
        ),
      ),
    );
  }
}
