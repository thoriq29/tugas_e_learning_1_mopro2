import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/common/state_enum.dart';
import 'package:moh_torikul_a_tugas_elearning_1/common/text_utils.dart';
import 'package:moh_torikul_a_tugas_elearning_1/data/models/todo.dart';

class AssignmentProvider extends ChangeNotifier {
  
  late RequestState _state;
  RequestState get state => _state;
  final TodoModel test = TodoModel(deadlineDate: DateTime.now(), deadlineTime: TimeOfDay.now(), name: "Test", id: "aaaaaaaaa", isFinished: false);
  final List<TodoModel> _taskList = [];
  
  List<TodoModel> get taskList => _taskList;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;
  set textEditingController(TextEditingController newValue) {
    _textEditingController = newValue;
    notifyListeners();
  }

  AssignmentProvider() {
    _taskList.add(test);
  }
  void insertToTaskList(String name, DateTime deadlineDate, TimeOfDay deadlineTime) {
    String id = generateID(15);
    TodoModel data = TodoModel(id: id, name: name, deadlineDate: deadlineDate, deadlineTime: deadlineTime, isFinished: false);
    _taskList.add(data);
    notifyListeners();
  }

  int get unFinishedTaskCount => taskList.where((i) => i.isFinished == false).toList().length;
  int get finishedTaskCount => taskList.where((i) => i.isFinished).toList().length;

  // setFinished Todo
  void setFinishedTodo(String id) {
    Tuple2<int, TodoModel> data = getTodo(id);

    int index           = data.value1;
    TodoModel todoData  = data.value2;
    todoData.isFinished = true;
    _taskList[index]    = todoData;

    notifyListeners();
  }

  void removeTodo(String id) {
    Tuple2<int, TodoModel> data = getTodo(id);

    int index = data.value1;
    _taskList.removeAt(index);
    notifyListeners();
  }

  // getTodo dan return 2 value (index & todoModel)
  Tuple2<int, TodoModel> getTodo(String id) {
    int index      = _taskList.indexWhere((todo) => todo.id == id);
    TodoModel data = _taskList.firstWhere((todo) => todo.id == id);
    return Tuple2(index, data);
  }

  DateTime? _deadlineDate = DateTime.now();

  DateTime? get deadlineDate => _deadlineDate;
  set deadlineDate(DateTime? newValue) {
    _deadlineDate = newValue;
    notifyListeners();
  }

  TimeOfDay? _deadlineTime = TimeOfDay.now();
  TimeOfDay? get deadlineTime => _deadlineTime;
  set deadlineTime(TimeOfDay? newValue) {
    _deadlineTime = newValue;
    notifyListeners();
  }
}