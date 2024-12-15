import '../pages/allpages.dart';

final rout = {
  '/':          (context) => const Login(),
  '/DateData':  (context) => const DateData(),
  '/Registr':   (context) => const Registr(),
  '/Groups':    (context) => const Groups(),
  '/AddOrEdit': (context) => const AddOrEdit(),
  '/AddSchedule': (context) => const AddSchedule(),
};
