import 'package:flutter/material.dart';

import '../models/book.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Author: ${book.author}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Published: ${book.publishDate}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            if (book.ebookLink.isNotEmpty)
              TextButton(
                onPressed: () {
                  // Open ebook link
                },
                child: const Text('Get eBook'),
              ),
            if (book.amazonLink.isNotEmpty)
              TextButton(
                onPressed: () {
                  // Open Amazon link
                },
                child: const Text('Buy on Amazon'),
              ),
            const SizedBox(height: 20),
            const Text('Professors who have used this book:', style: TextStyle(fontSize: 18)),
            ...book.professors.map((professor) => Text(professor)).toList(),
          ],
        ),
      ),
    );
  }
}
