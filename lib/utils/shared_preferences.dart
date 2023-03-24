// import 'package:shared_preferences/shared_preferences.dart';

// class CustomPreferenses {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   Future<void> setInt(String key, int value) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setInt(key, value);
//   }

//   Future<void> setBool(String key, bool value) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setBool(key, value);
//   }

//   Future<void> setDouble(String key, double value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble(key, value);
//   }

//   void setString(String key, value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//   }

//   Future<void> setStringList(String key, List<String> value) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setStringList(key, value);
//   }

//   Future<int> getInt(String key) async {
//     final SharedPreferences prefs = await _prefs;
//     final int angka = prefs.getInt(key) ?? 0;
//     return angka;
//   }

//   Future<String> getStringKey(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key) ?? 'Tidak ada';
//   }
// }
