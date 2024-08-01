import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/school.dart';
import '../models/career.dart';
import '../models/course.dart';

class SchoolService {
  static Map<String, School> parseSchools(String jsonString) {
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((schoolId, schoolData) {
      // Cast `schoolData` to `Map<String, dynamic>`
      final schoolMap = schoolData as Map<String, dynamic>;
      return MapEntry(schoolId, School(
        name: schoolId, // Assuming the school ID is used as the name
        icon: Icons.school, // Replace with an appropriate icon
        schoolId: schoolId,
        careers: schoolMap.entries.map((careerEntry) {
          // Cast `careerEntry.value` to `List`
          final coursesList = careerEntry.value as List;
          return Career(
            name: careerEntry.key,
            careerId: careerEntry.key,
            courses: coursesList.map((courseData) {
              // `courseData` is expected to be a list: [courseId, name]
              return Course(
                courseId: courseData[0] as String,
                name: courseData[1] as String,
              );
            }).toList(),
          );
        }).toList(),
      ));
    });
  }
}
