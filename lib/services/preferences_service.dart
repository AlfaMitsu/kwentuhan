import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _likedStoriesKey = 'kwentuhan-liked-stories';

  Future<Set<String>> loadLikedStories() async {
    final preferences = await SharedPreferences.getInstance();
    return (preferences.getStringList(_likedStoriesKey) ?? <String>[]).toSet();
  }

  Future<void> saveLikedStories(Set<String> stories) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_likedStoriesKey, stories.toList()..sort());
  }
}
