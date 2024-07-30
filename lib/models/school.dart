import 'package:flutter/material.dart';

import 'career.dart';

class School {
  final String name;
  final IconData icon;
  final List<Career> careers;
  final String schoolId;

  School({
    required this.name,
    required this.icon,
    required this.careers,
    required this.schoolId,
  });
}