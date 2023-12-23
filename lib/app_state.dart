import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _totalscore = prefs.getInt('ff_totalscore') ?? _totalscore;
    });
    _safeInit(() {
      _gad7 = prefs.getInt('ff_gad7') ?? _gad7;
    });
    _safeInit(() {
      _depression = prefs.getInt('ff_depression') ?? _depression;
    });
    _safeInit(() {
      _mood = prefs.getStringList('ff_mood')?.map(int.parse).toList() ?? _mood;
    });
    _safeInit(() {
      _date = prefs.getStringList('ff_date') ?? _date;
    });
    _safeInit(() {
      _promptResult = prefs.getString('ff_promptResult') ?? _promptResult;
    });
    _safeInit(() {
      _Address = prefs.getString('ff_Address') ?? _Address;
    });
    _safeInit(() {
      _streak = prefs.getInt('ff_streak') ?? _streak;
    });
    _safeInit(() {
      _credit = prefs.getInt('ff_credit') ?? _credit;
    });
    _safeInit(() {
      _yesterdaysDate = prefs.getInt('ff_yesterdaysDate') ?? _yesterdaysDate;
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _completedQuestions = 0;
  int get completedQuestions => _completedQuestions;
  set completedQuestions(int value) {
    _completedQuestions = value;
  }

  int _totalscore = 0;
  int get totalscore => _totalscore;
  set totalscore(int value) {
    _totalscore = value;
    prefs.setInt('ff_totalscore', value);
  }

  int _sec4score = 0;
  int get sec4score => _sec4score;
  set sec4score(int value) {
    _sec4score = value;
  }

  int _sec1score = 0;
  int get sec1score => _sec1score;
  set sec1score(int value) {
    _sec1score = value;
  }

  int _sec2score = 0;
  int get sec2score => _sec2score;
  set sec2score(int value) {
    _sec2score = value;
  }

  int _sec3score = 0;
  int get sec3score => _sec3score;
  set sec3score(int value) {
    _sec3score = value;
  }

  int _gad7 = 0;
  int get gad7 => _gad7;
  set gad7(int value) {
    _gad7 = value;
    prefs.setInt('ff_gad7', value);
  }

  int _depression = 0;
  int get depression => _depression;
  set depression(int value) {
    _depression = value;
    prefs.setInt('ff_depression', value);
  }

  int _suicide = 0;
  int get suicide => _suicide;
  set suicide(int value) {
    _suicide = value;
  }

  int _ptsd = 0;
  int get ptsd => _ptsd;
  set ptsd(int value) {
    _ptsd = value;
  }

  List<int> _mood = [];
  List<int> get mood => _mood;
  set mood(List<int> value) {
    _mood = value;
    prefs.setStringList('ff_mood', value.map((x) => x.toString()).toList());
  }

  void addToMood(int value) {
    _mood.add(value);
    prefs.setStringList('ff_mood', _mood.map((x) => x.toString()).toList());
  }

  void removeFromMood(int value) {
    _mood.remove(value);
    prefs.setStringList('ff_mood', _mood.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMood(int index) {
    _mood.removeAt(index);
    prefs.setStringList('ff_mood', _mood.map((x) => x.toString()).toList());
  }

  void updateMoodAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _mood[index] = updateFn(_mood[index]);
    prefs.setStringList('ff_mood', _mood.map((x) => x.toString()).toList());
  }

  void insertAtIndexInMood(int index, int value) {
    _mood.insert(index, value);
    prefs.setStringList('ff_mood', _mood.map((x) => x.toString()).toList());
  }

  List<String> _date = [];
  List<String> get date => _date;
  set date(List<String> value) {
    _date = value;
    prefs.setStringList('ff_date', value);
  }

  void addToDate(String value) {
    _date.add(value);
    prefs.setStringList('ff_date', _date);
  }

  void removeFromDate(String value) {
    _date.remove(value);
    prefs.setStringList('ff_date', _date);
  }

  void removeAtIndexFromDate(int index) {
    _date.removeAt(index);
    prefs.setStringList('ff_date', _date);
  }

  void updateDateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _date[index] = updateFn(_date[index]);
    prefs.setStringList('ff_date', _date);
  }

  void insertAtIndexInDate(int index, String value) {
    _date.insert(index, value);
    prefs.setStringList('ff_date', _date);
  }

  String _promptResult = 'Please wait...';
  String get promptResult => _promptResult;
  set promptResult(String value) {
    _promptResult = value;
    prefs.setString('ff_promptResult', value);
  }

  String _Address =
      'https://www.google.com/maps/search/mental+health+centres+near+sai+krishna+nagar+1st+lane+,+guntur';
  String get Address => _Address;
  set Address(String value) {
    _Address = value;
    prefs.setString('ff_Address', value);
  }

  int _streak = 6;
  int get streak => _streak;
  set streak(int value) {
    _streak = value;
    prefs.setInt('ff_streak', value);
  }

  int _credit = 0;
  int get credit => _credit;
  set credit(int value) {
    _credit = value;
    prefs.setInt('ff_credit', value);
  }

  int _yesterdaysDate = 0;
  int get yesterdaysDate => _yesterdaysDate;
  set yesterdaysDate(int value) {
    _yesterdaysDate = value;
    prefs.setInt('ff_yesterdaysDate', value);
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    prefs.setString('ff_apiKey', value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  List<dynamic> _currentConversation = [];
  List<dynamic> get currentConversation => _currentConversation;
  set currentConversation(List<dynamic> value) {
    _currentConversation = value;
  }

  void addToCurrentConversation(dynamic value) {
    _currentConversation.add(value);
  }

  void removeFromCurrentConversation(dynamic value) {
    _currentConversation.remove(value);
  }

  void removeAtIndexFromCurrentConversation(int index) {
    _currentConversation.removeAt(index);
  }

  void updateCurrentConversationAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _currentConversation[index] = updateFn(_currentConversation[index]);
  }

  void insertAtIndexInCurrentConversation(int index, dynamic value) {
    _currentConversation.insert(index, value);
  }

  String _intialScript = 'You are an experienced mental health professional.';
  String get intialScript => _intialScript;
  set intialScript(String value) {
    _intialScript = value;
  }

  String _speechToTextResponse = '';
  String get speechToTextResponse => _speechToTextResponse;
  set speechToTextResponse(String value) {
    _speechToTextResponse = value;
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int value) {
    _timerValue = value;
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
