import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  static const String baseUrl = 'https://morning-darkness-ff56.sebastian-mg4.workers.dev';

  static Future<Book> fetchBook(String schoolId, String careerId, String courseId, String bookId) async {
    final response = await http.get(Uri.parse('$baseUrl/$schoolId/$careerId/$courseId/$bookId.json'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Book.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load book');
    }
  }

  static Future<List<String>> fetchBookNames(String schoolId, String careerId, String courseId) async {
    final response = await http.get(Uri.parse('$baseUrl/?prefix=$schoolId/$careerId/$courseId'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var objects = jsonResponse['objects'] as List;
  
      return objects.map((object) {
        var key = object['key'].toString().replaceAll(".json", "");
        return key.split("/").last;}).toList();
    } else {
      throw Exception('Failed to get book names.');
    }
  }

  static Future<void> addBook(String schoolId, String careerId, String courseId, Book book, String bookId) async {
    var finalBookId = bookId.replaceAll(" ", "_");
    final response = await http.post(
      Uri.parse('$baseUrl/$schoolId/$careerId/$courseId/$finalBookId.json'),
      body: json.encode(book.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add book');
    }
  }

  static Future<void> updateBook(String schoolId, String careerId, String courseId, Book book, String bookId) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$careerId/$courseId/$bookId.json'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(book.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update book');
    }
  }
}
