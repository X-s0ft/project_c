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

    String argument = ModalRoute.of(context)!.settings.arguments as String;
    final ref = FirebaseFirestore.instance.collection(argument).snapshots();

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
            Scrollbar(
              child: Column(
                children: [
                  StreamBuilder(
                    stream: ref,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Проблемы с подключением');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Загрузка...');
                      }

                      var docs = snapshot.data!.docs;
                      return Text('${docs.length}');
                     
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
