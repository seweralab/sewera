import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  dynamic _currentServiceQuiz;
  dynamic get currentServiceQuiz => _currentServiceQuiz;
  set currentServiceQuiz(dynamic _value) {
    _currentServiceQuiz = _value;
  }

  int _currentQuizIndex = 0;
  int get currentQuizIndex => _currentQuizIndex;
  set currentQuizIndex(int _value) {
    _currentQuizIndex = _value;
  }

  List<String> _currentServiceQuizArr = [];
  List<String> get currentServiceQuizArr => _currentServiceQuizArr;
  set currentServiceQuizArr(List<String> _value) {
    _currentServiceQuizArr = _value;
  }

  void addToCurrentServiceQuizArr(String _value) {
    _currentServiceQuizArr.add(_value);
  }

  void removeFromCurrentServiceQuizArr(String _value) {
    _currentServiceQuizArr.remove(_value);
  }

  void removeAtIndexFromCurrentServiceQuizArr(int _index) {
    _currentServiceQuizArr.removeAt(_index);
  }

  void updateCurrentServiceQuizArrAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_currentServiceQuizArr[_index]);
  }

  List<LatLng> _coords = [];
  List<LatLng> get coords => _coords;
  set coords(List<LatLng> _value) {
    _coords = _value;
  }

  void addToCoords(LatLng _value) {
    _coords.add(_value);
  }

  void removeFromCoords(LatLng _value) {
    _coords.remove(_value);
  }

  void removeAtIndexFromCoords(int _index) {
    _coords.removeAt(_index);
  }

  void updateCoordsAtIndex(
    int _index,
    Function(LatLng) updateFn,
  ) {
    updateFn(_coords[_index]);
  }

  DocumentReference? _currentOrder;
  DocumentReference? get currentOrder => _currentOrder;
  set currentOrder(DocumentReference? _value) {
    _currentOrder = _value;
  }

  String _currentRadioQuiz = '';
  String get currentRadioQuiz => _currentRadioQuiz;
  set currentRadioQuiz(String _value) {
    _currentRadioQuiz = _value;
  }

  String _currentQuizRadioInput = '';
  String get currentQuizRadioInput => _currentQuizRadioInput;
  set currentQuizRadioInput(String _value) {
    _currentQuizRadioInput = _value;
  }

  bool _currentQuizRadieInputErr = false;
  bool get currentQuizRadieInputErr => _currentQuizRadieInputErr;
  set currentQuizRadieInputErr(bool _value) {
    _currentQuizRadieInputErr = _value;
  }

  List<String> _currentCheckQuiz = [];
  List<String> get currentCheckQuiz => _currentCheckQuiz;
  set currentCheckQuiz(List<String> _value) {
    _currentCheckQuiz = _value;
  }

  void addToCurrentCheckQuiz(String _value) {
    _currentCheckQuiz.add(_value);
  }

  void removeFromCurrentCheckQuiz(String _value) {
    _currentCheckQuiz.remove(_value);
  }

  void removeAtIndexFromCurrentCheckQuiz(int _index) {
    _currentCheckQuiz.removeAt(_index);
  }

  void updateCurrentCheckQuizAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_currentCheckQuiz[_index]);
  }

  String _currentCheckInputQuiz = '';
  String get currentCheckInputQuiz => _currentCheckInputQuiz;
  set currentCheckInputQuiz(String _value) {
    _currentCheckInputQuiz = _value;
  }

  bool _currentCheckInputQuizErr = false;
  bool get currentCheckInputQuizErr => _currentCheckInputQuizErr;
  set currentCheckInputQuizErr(bool _value) {
    _currentCheckInputQuizErr = _value;
  }

  bool _currentQuizTopErr = false;
  bool get currentQuizTopErr => _currentQuizTopErr;
  set currentQuizTopErr(bool _value) {
    _currentQuizTopErr = _value;
  }

  String _currentQuizDeadline = '';
  String get currentQuizDeadline => _currentQuizDeadline;
  set currentQuizDeadline(String _value) {
    _currentQuizDeadline = _value;
  }

  LatLng? _locationLatLng;
  LatLng? get locationLatLng => _locationLatLng;
  set locationLatLng(LatLng? _value) {
    _locationLatLng = _value;
  }

  String _currentQuizAddr = '';
  String get currentQuizAddr => _currentQuizAddr;
  set currentQuizAddr(String _value) {
    _currentQuizAddr = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
