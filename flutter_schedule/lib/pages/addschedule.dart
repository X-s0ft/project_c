import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  String? _selectedGroup;
  DateTime? _selectedDate;
  List<String> _groups = [];
  List<String> _subjects = [];
  final List<String> _pairNumbers = List.generate(10, (index) => (index + 1).toString());
  final List<String?> _selectedPairNumbers = [];
  final List<String?> _selectedSubjects = [];
  int _fieldCount = 1;

  @override
  void initState() {
    super.initState();
    _fetchGroups();
    _fetchSubjects();
    _initializeSelectedFields();
  }

  void _initializeSelectedFields() {
    _selectedPairNumbers.clear();
    _selectedSubjects.clear();
    for (int i = 0; i < _fieldCount; i++) {
      _selectedPairNumbers.add(null);
      _selectedSubjects.add(null);
    }
  }

  Future<void> _fetchGroups() async {
    await _fetchData('groups', (data) {
      setState(() {
        _groups = data.map((doc) => doc['name'] as String).toList();
      });
    });
  }

  Future<void> _fetchSubjects() async {
    await _fetchData('subjects', (data) {
      setState(() {
        _subjects = data.map((doc) => doc['name'] as String).toList();
      });
    });
  }

  Future<void> _fetchData(String collection, Function(List<QueryDocumentSnapshot>) onSuccess) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(collection).get();
      onSuccess(snapshot.docs);
    } catch (e) {
      print('Error fetching $collection: $e');
    }
  }

  Future<void> _createDocument() async {
    if (!_formKey.currentState!.validate()) return;

    final scheduleData = Map.fromIterables(_selectedPairNumbers, _selectedSubjects);
    String? formattedDate = _selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : null;

    final data = {
      'Группа': _selectedGroup,
      'Дата': formattedDate,
      'Расписание': scheduleData,
    };

    try {
      // Проверяем, существует ли документ с такой же группой и датой
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('schedule')
        .where('Группа', isEqualTo: _selectedGroup)
        .where('Дата', isEqualTo: formattedDate)
        .get();

      // Если документ существует, выводим сообщение и выходим
      if (querySnapshot.docs.isNotEmpty) {
        _showErrorSnackBar('Расписание для этой группы на эту дату уже существует!');
        return;
      }

      // Если документ не существует, создаем новый
      await FirebaseFirestore.instance.collection('schedule').add(data);
      _clearFields();
      _showSuccessSnackBar();
    } catch (e) {
      print('Error creating document: $e');
    }
  }

  void _showSuccessSnackBar() {
    final snackBar = SnackBar(
      content: const Text('Расписание успешно добавлено!'),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _clearFields() {
    setState(() {
      _selectedGroup = null;
      _selectedDate = null;
      _dateController.clear();
      _initializeSelectedFields();
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
  }

  void _addField() {
    setState(() {
      _fieldCount++;
      _selectedPairNumbers.add(null);
      _selectedSubjects.add(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить расписание'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildDateField(),
              _buildGroupDropdown(),
              ...List.generate(_fieldCount, (index) => _buildPairRow(index)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createDocument,
                child: const Text('Сохранить'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addField,
                child: const Text('Добавить поле'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildDateField() {
    return TextFormField(
      controller: _dateController,
      decoration: const InputDecoration(labelText: 'Дата'),
      readOnly: true,
      onTap: () => _selectDate(context),
      validator: (value) => _selectedDate == null ? 'Пожалуйста, выберите дату' : null,
    );
  }

  DropdownButtonFormField<String> _buildGroupDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGroup,
      decoration: const InputDecoration(labelText: 'Группа'),
      items: _groups.map((String group) {
        return DropdownMenuItem<String>(
          value: group,
          child: Text(group),
        );
      }).toList(),
      onChanged: (value) => setState(() => _selectedGroup = value),
      validator: (value) => value == null ? 'Пожалуйста, выберите группу' : null,
    );
  }

  Widget _buildPairRow(int index) {
    return Row(
      children: [
        Expanded(
          child: _buildDropdownField(
            label: 'Номер пары ${index + 1}',
            items: _pairNumbers,
            onChanged: (value) => setState(() => _selectedPairNumbers[index] = value),
            validator: (value) => value == null ? 'Пожалуйста, выберите номер пары' : null,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: _buildDropdownField(
            label: 'Предмет ${index + 1}',
            items: _subjects,
            onChanged: (value) => setState(() => _selectedSubjects[index] = value),
            validator: (value) => value == null ? 'Пожалуйста, выберите предмет' : null,
          ),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> _buildDropdownField({
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required FormFieldValidator<String?> validator,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
