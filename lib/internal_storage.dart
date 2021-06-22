import 'package:shared_preferences/shared_preferences.dart';

class InternalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(int id, String title) async {
    final internalPref = await _prefs;
    internalPref.setInt('id', id);
    internalPref.setString('title', title);
  }
}
