import 'package:flutter/material.dart';
import 'search_books.dart';

void main() {
  runApp(UniApp());
}

class UniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UniApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to UniApp!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            CategoryButton(
              icon: Icons.book,
              label: 'Search Books',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchBooksPage()),
                );
              },
            ),

            CategoryButton(
              icon: Icons.calculate,
              label: 'Grade Calculator',
              onPressed: () {
                // Navigate to Grade Calculator page
              },
            ),
            CategoryButton(
              icon: Icons.rate_review,
              label: 'Rate Professors',
              onPressed: () {
                // Navigate to Rate Professors page
              },
            ),
            CategoryButton(
              icon: Icons.calendar_today,
              label: 'Event Calendar',
              onPressed: () {
                // Navigate to Event Calendar page
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  CategoryButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
