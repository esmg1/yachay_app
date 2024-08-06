
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
      Career(
        name: 'Computer Science',
        careerId: 'tics',
        courses: [
          Course(
            name: 'Calculus I',
            courseId: 'calc_1',
          ),
        ],
      ),
    ],
  ),
  School(
    name: 'SCHOOL OF AGRICULTURAL AND AGRO-INDUSTRIAL SCIENCES',
    schoolId: 'agro',
    icon: Icons.agriculture,
    careers: [
      Career(
        name: 'Food Agroindustry',
        careerId: 'food',
        courses: [
        ],
      ),
    ],
  ),
  School(
    name: 'SCHOOL OF BIOLOGICAL SCIENCES AND ENGINEERING',
    schoolId: 'bios',
    icon: Icons.biotech,
    careers: [
      Career(
        name: 'Biology',
        careerId: 'biology',
        courses: [
        ],
      ),
      Career(
        name: 'Biomedical Engineering',
        careerId: 'biomedical',
        courses: [
        ],
      ),
    ],
  ),
  School(
    name: 'SCHOOL OF PHYSICAL SCIENCES AND NANOTECHNOLOGY',
    schoolId: 'phys',
    icon: Icons.hexagon_outlined,
    careers: [
      Career(
        name: 'Physics',
        careerId: 'physics',
        courses: [
        ],
      ),
      Career(
        name: 'Nanotechnology',
        careerId: 'nano',
        courses: [
        ],
      ),
    ],
  ),
  School(
    name: 'SCHOOL OF EARTH SCIENCES, ENERGY AND ENVIRONMENT',
    schoolId: 'geos',
    icon: Icons.public,
    careers: [
      Career(
        name: 'Geology',
        careerId: 'geo',
        courses: [
        ],
      ),
    ],
  ),
  School(
    name: 'SCHOOL OF CHEMICAL SCIENCES AND ENGINEERING',
    schoolId: 'chem',
    icon: Icons.science,
    careers: [
      Career(
        name: 'Materials',
        careerId: 'materials',
        courses: [
        ],
      ),
      Career(
        name: 'Chemistry',
        careerId: 'chemistry',
        courses: [
        ],
      ),
      Career(
        name: 'Petrochemical Engineering',
        careerId: 'petro',
        courses: [
        ],
      ),
      Career(
        name: 'Polymer Engineering',
        careerId: 'polymer',
        courses: [
        ],
      ),
    ],
  ),
  // Add more schools
  School(
    name: 'ENGLISH LANGUAGE PROGRAM',
    schoolId: 'english',
    icon: Icons.public,
    careers: [
      Career(
        name: 'ELP Curriculum',
        careerId: 'elp',
        courses: [
        ],
      ),    
      ],
  ),
];
