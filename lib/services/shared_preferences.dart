import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<bool> updateUsage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }

  Future<bool> getUsage() async {
    final prefs = await SharedPreferences.getInstance();
    final usage = prefs.getBool('first_time');
    if (usage == null) {
      return true;
    }
    return usage;
  }
}
