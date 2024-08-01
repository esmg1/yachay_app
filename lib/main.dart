import 'package:flutter/material.dart';
import 'pages/books_page.dart';

void main() {
  runApp(const UniApp());
}

class UniApp extends StatelessWidget {
  const UniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YT Multitool (Nombre de Prueba)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YT Multitool (Nombre de prueba)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to YT Multitool (Nombre de prueba)!',
              style: TextStyle(fontSize: 24), 
            ),
            const SizedBox(height: 20),
            CategoryButton(
              icon: Icons.book,
              label: 'Search Books',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksPage()),
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

  const CategoryButton({super.key, required this.icon, required this.label, required this.onPressed});

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
