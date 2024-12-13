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
       
        title: const Text(
          'Расписание',
         
        ),
        
      ),
      
     
    );
  }
}