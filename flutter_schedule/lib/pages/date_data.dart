import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shedule/pages/allpages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DateData extends StatefulWidget {
  const DateData({super.key});

  @override
  State<DateData> createState() => _DateDataState();
}

class _DateDataState extends State<DateData> {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // Метод для получения данных из Cloud Firestore
  void _getData() async {
    QuerySnapshot snapshot = await firestore
        .collection('schedule')
        .orderBy("Дата", descending: true)
        .get();

    // Преобразование полученных данных в список
    List<Map<String, dynamic>> dataList =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    // Обновление состояния
    setState(() {
      _data = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        title: Text('Расписание'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          // Получение всех полей документа
          final document = _data[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: document.entries.map((entry) {
                  return Text('${entry.key}: ${entry.value}',
                      style: TextStyle(fontSize: 16));
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
