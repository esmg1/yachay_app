import 'course.dart';

class Career {
  final String name;
  final String careerId;
  final List<Course> courses;
  

  Career({
    required this.name,
    required this.courses,
    required this.careerId,
  });
}