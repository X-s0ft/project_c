import 'package:flutter/material.dart';
import './routers/router.dart';


void main() {
  runApp(const MainSchedule());
}


class MainSchedule extends StatelessWidget {
  const MainSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: null,
      routes: rout,
      debugShowCheckedModeBanner: false,
    );
  }
}