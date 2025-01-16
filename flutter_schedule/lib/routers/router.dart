import '../pages/allpages.dart';

final rout = {
  '/':            (context) => const Login(), // Главная странила для вхоида в приложение
  '/DateData':    (context) => const DateData(), // Гловные данные для обычного пользователя
  '/Registr':     (context) => const Registr(), // Добавление новых пользователей (только для админа)
  '/Groups':      (context) => const Groups(), // Выбор группы (только для админа)
  '/AddSchedule': (context) => const AddSchedule(), // Добавление расписания (только для админа)
};
