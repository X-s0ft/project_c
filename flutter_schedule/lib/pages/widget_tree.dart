import 'package:shedule/pages/allpages.dart';
import 'package:flutter/material.dart';
import 'package:shedule/pages/logintest.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder : (context, snapshot) {
        if (snapshot.hasData) {
          return DateData();
        } else {
          return Logintest();
        }
      },
    );
  }
}