import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://api.quotable.io';

  Future<Map<String, dynamic>> getRandomQuote() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/random'));

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception('Error fetching quote: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getQuotes({int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/quotes?limit=$limit'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final results = data['results'] as List;
        return results.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      throw Exception('Error fetching quotes: $e');
    }
  }
}
