import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static const String _favoritesKey = 'favorites';
  static const String _habitsKey = 'habits';

  Future<void> saveFavorite(String habitName, bool isFavorite) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    if (isFavorite) {
      favorites.add(habitName);
    } else {
      favorites.remove(habitName);
    }

    await prefs.setStringList(_favoritesKey, favorites.toList());
  }

  Future<Set<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesList = prefs.getStringList(_favoritesKey) ?? [];
    return favoritesList.toSet();
  }

  Future<bool> isFavorite(String habitName) async {
    final favorites = await getFavorites();
    return favorites.contains(habitName);
  }

  Future<void> saveHabitProgress(String habitName, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_habitsKey}_$habitName';
    await prefs.setString(key, json.encode(data));
  }

  Future<Map<String, dynamic>?> getHabitProgress(String habitName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_habitsKey}_$habitName';
    final jsonString = prefs.getString(key);

    if (jsonString != null) {
      return json.decode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
