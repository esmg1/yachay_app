import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/book_service.dart';
import 'add_book_page.dart';
import 'book_page.dart';

class CoursePage extends StatelessWidget {
  final Course course;
  final String careerId;
  final String schoolId;

  const CoursePage({super.key, required this.course, required this.schoolId, required this.careerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: FutureBuilder<List<String>>(
        future: BookService.fetchBookNames(schoolId, careerId, course.courseId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load books: ${snapshot.error}'));
          } else {
            final bookNames = snapshot.data ?? [];
            return ListView.builder(
              itemCount: bookNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookNames[index]),
                  leading: const Icon(Icons.book),
                  onTap: () async {
                    try {
                      final book = await BookService.fetchBook(
                        schoolId, 
                        careerId, 
                        course.courseId, 
                        bookNames[index]
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookPage(book: book),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to load book details')),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBookPage(courseId: course.courseId, careerId: careerId, schoolId: schoolId)),
          );
        },
        tooltip: 'Add a new book',
        child: const Icon(Icons.add),
      ),
    );
  }
}