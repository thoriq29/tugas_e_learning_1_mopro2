import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  int _currentIndex = 0;
  int get pageIndex => _currentIndex;
  
  String _titlePage = "Dashboard";
  String get title => _titlePage;

  set setCurrentIndex(val) {
    _currentIndex = val;
    switch(val) {
      case 1: 
        _titlePage = "List Tugas";
        break;
      case 2: 
        _titlePage = "Profil";
        break;
      default:
        _titlePage = "Dashboard";
        break;
    }
    notifyListeners();
  }


  late PageController _controller;
  PageController get controller => _controller;

  HomeProvider() {
    controller = PageController(initialPage: 0);
  }

  set controller(PageController newValue) {
    _controller = newValue;
    notifyListeners();
  }

}