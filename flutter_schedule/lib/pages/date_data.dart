import 'package:flutter/material.dart';

class DateData extends StatefulWidget {
  const DateData({super.key});

  @override
  State<DateData> createState() => _DateDataState();
}

class _DateDataState extends State<DateData> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 200, 227),
        title: const Text(
          'Дата',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      // body: ,
    );
  }
}