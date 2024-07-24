
import 'package:flutter/material.dart';

import 'package:yachay_app/models/book.dart';
import 'package:yachay_app/models/career.dart';
import 'package:yachay_app/models/course.dart';
import 'package:yachay_app/models/school.dart';

final List<School> schools = [
  School(
    name: 'SCHOOL OF MATHEMATICAL AND COMPUTATIONAL SCIENCES',
    icon: Icons.computer,
    careers: [
      Career(
        name: 'Mathematics',
        courses: [
          Course(
            name: 'Calculus I',
            books: [
              Book(
                name: 'Calculus: Early Transcendentals',
                author: 'James Stewart',
                publishDate: '2015',
                ebookLink: 'https://example.com/calculus1-ebook',
                amazonLink: 'https://www.amazon.com/dp/B00XIHG8I6',
                professors: ['C. Mayorga 1st', 'P. Narvaez 2nd'],
              ),
              // Add more books
            ],
          ),
          Course(
            name: 'Calculus II',
            books: [
              // Add books for Calculus II
            ],
          ),
          Course(
            name: 'Calculus III',
            books: [
              // Add books for Calculus III
            ],
          ),
          Course(
            name: 'Linear Algebra',
            books: [
              // Add books for Linear Algebra
            ],
          ),
        ],
      ),
      // Add more careers
    ],
  ),
  // Add more schools
];
