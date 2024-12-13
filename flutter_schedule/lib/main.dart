import 'package:flutter/material.dart';
import 'package:shedule/theme/theme.dart';
import './routers/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainSchedule());
} 

class MainSchedule extends StatelessWidget {
  const MainSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: maintheme,
      routes: rout,
      debugShowCheckedModeBanner: false,
    );
  }
}
