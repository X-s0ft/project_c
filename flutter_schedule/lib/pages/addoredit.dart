import 'package:flutter/material.dart';

class AddOrEdit extends StatefulWidget {
  const AddOrEdit({super.key});

  @override
  State<AddOrEdit> createState() => _AddOrEditState();
}

class _AddOrEditState extends State<AddOrEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 200, 227),
        title: const Text(
          'Расписание',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        
      ),
      
     
    );
  }
}