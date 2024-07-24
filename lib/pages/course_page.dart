import 'package:flutter/material.dart';
import '../models/course.dart';
import 'book_page.dart';

class CoursePage extends StatelessWidget {
  final Course course;

  const CoursePage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: ListView.builder(
        itemCount: course.books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(course.books[index].name),
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookPage(book: course.books[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
