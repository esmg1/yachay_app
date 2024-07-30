
import 'package:flutter/material.dart';

import 'package:yachay_app/models/career.dart';
import 'package:yachay_app/models/course.dart';
import 'package:yachay_app/models/school.dart';


final List<School> schools = [
  School(
    name: 'SCHOOL OF MATHEMATICAL AND COMPUTATIONAL SCIENCES',
    schoolId: 'mtics',
    icon: Icons.computer,
    careers: [
      Career(
        name: 'Mathematics',
        careerId: 'math',
        courses: [
          Course(
            name: 'Calculus I',
            courseId: 'calc_1',
          ),
          Course(
            name: 'Calculus II',
            courseId: 'calc_2',
          ),
          Course(
            name: 'Calculus III',
            courseId: 'calc_3',
          ),
          Course(
            name: 'Linear Algebra',
            courseId: 'lin_alg',
          ),
        ],
      ),
      // Add more careers
    ],
  ),
  // Add more schools
];
