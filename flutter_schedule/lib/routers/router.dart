import 'package:shedule/pages/widget_tree.dart';

import '../pages/allpages.dart';

final rout = {
  '/': (context) => const WidgetTree(),
  '/Login': (context) => const Login(),
  '/DateData': (context) => const DateData(),
  '/Registr': (context) => const Registr(),
  '/Settings': (context) => const SettingsPage(),
};
