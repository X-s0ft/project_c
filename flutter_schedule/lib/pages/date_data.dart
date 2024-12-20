import 'package:flutter/material.dart';
import 'package:shedule/pages/addschedule.dart';
import 'package:shedule/pages/allpages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DateData extends StatefulWidget {
  const DateData({super.key});

  @override
  State<DateData> createState() => _DateDataState();
}

class _DateDataState extends State<DateData> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> _data = [];
  List<String> _groups = []; // Список групп
  String? _selectedGroup; // Выбранная группа

  @override
  void initState() {
    super.initState();
    _getGroups(); // Получаем список групп при инициализации
  }

  // Метод для получения списка групп
  Future<void> _getGroups() async {
    QuerySnapshot snapshot = await firestore.collection('schedule').get();
    Set<String> groupSet = {}; // Используем Set для уникальных значений

    for (var doc in snapshot.docs) {
      groupSet.add(doc['Группа']); // Добавляем группы в Set
    }

    setState(() {
      _groups = groupSet.toList(); // Преобразуем Set в список
      if (_groups.isNotEmpty) {
        _selectedGroup = _groups[0]; // Устанавливаем первую группу по умолчанию
        _getData(_selectedGroup!); // Получаем данные для первой группы
      }
    });
  }

  // Метод для получения данных для выбранной группы
  Future<void> _getData(String group) async {
    QuerySnapshot snapshot = await firestore
        .collection('schedule')
        .where("Группа", isEqualTo: group) // Фильтруем по выбранной группе
        .get();

    List<Map<String, dynamic>> dataList =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    setState(() {
      _data = dataList; // Обновляем состояние с новыми данными
    });
  }

  // Метод для сброса выбранной группы
  void _resetSelection() {
    setState(() {
      _selectedGroup = null; // Сбрасываем выбранную группу
      _data = []; // Очищаем данные
    });
  }

  // Метод для обновления данных при потягивании вниз
  Future<void> _refreshData() async {
    if (_selectedGroup != null) {
      await _getData(_selectedGroup!); // Обновляем данные для выбранной группы
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser ;
    bool showFAB = user != null && user.email == 'admin@mail.ru';

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        title: Text('Расписание'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData, // Указываем метод для обновления данных
        child: Column(
          children: [
            // Строка с припиской "Выбор группы" и выпадающим списком
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Выбор группы',
                    style: TextStyle(fontSize: 16), // Обычный шрифт
                  ),
                  SizedBox(width: 16), // Отступ между текстом и выпадающим списком
                  Expanded(
                    child: DropdownButton<String>(
                      value: _selectedGroup,
                      hint: Text('Выберите группу'),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGroup = newValue;
                          if (_selectedGroup != null) {
                            _getData(_selectedGroup!); // Получаем данные для выбранной группы
                          }
                        });
                      },
                      items: _groups.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // Кнопка сброса выбора группы
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: _resetSelection,
                    tooltip: 'Сбросить выбор',
                  ),
                ],
              ),
            ),
            Expanded(
              child: _selectedGroup == null
                  ? Center(child: Text('Пожалуйста, выберите группу для отображения расписания.'))
                  : ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        final document = _data[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: document.entries.map((entry) {
                                return Text('${entry.key}: ${entry.value}',
                                    style: TextStyle(fontSize: 16));
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: showFAB
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSchedule()),
                );
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
