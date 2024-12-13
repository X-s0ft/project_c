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
      
        title: const Text(
          'Дата',
         
        ),
      ),
      // body: ,
    );
  }
}