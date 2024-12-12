import 'package:flutter/material.dart';
import 'package:shedule/theme/theme.dart';
import './routers/router.dart';


void main() {
  runApp(const MainSchedule());
}


class MainSchedule extends StatelessWidget {
  const MainSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      routes: rout,
      debugShowCheckedModeBanner: false,
    );
  }
}