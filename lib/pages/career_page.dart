import 'package:flutter/material.dart';
import '../models/career.dart';
import 'course_page.dart';

class CareerPage extends StatelessWidget {
  final Career career;
  final String schoolId;
  const CareerPage({super.key, required this.career, required this.schoolId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(career.name),
      ),
      body: ListView.builder(
        itemCount: career.courses.length,
        itemBuilder: (context, index) {
          career.courses.sort((a, b) => a.name.compareTo(b.name));
          return ListTile(
            title: Text(career.courses[index].name),
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursePage(course: career.courses[index], schoolId: schoolId, careerId: career.careerId),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
