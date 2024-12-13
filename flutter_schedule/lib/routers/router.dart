import 'package:shedule/pages/logintest.dart';
import 'package:shedule/pages/widget_tree.dart';

import '../pages/allpages.dart';

final rout = {
  '/': (context) => const WidgetTree(),
  '/Login': (context) => const Logintest(),
  '/DateData': (context) => const DateData(),
  '/Registr': (context) => const Registr(),
  '/Groups': (context) => const Groups(),
  '/AddOrEdit': (context) => const AddOrEdit(),
};
