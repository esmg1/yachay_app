import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class AddBookPage extends StatefulWidget {
  final String schoolId;
  final String careerId;
  final String courseId;

  const AddBookPage({super.key, required this.schoolId, required this.careerId, required this.courseId});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _authorController = TextEditingController();
  final _publishDateController = TextEditingController();
  final _ebookLinkController = TextEditingController();
  final _amazonLinkController = TextEditingController();
  final _professorsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _authorController.dispose();
    _publishDateController.dispose();
    _ebookLinkController.dispose();
    _amazonLinkController.dispose();
    _professorsController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newBook = Book(
        name: _nameController.text,
        author: _authorController.text,
        publishDate: _publishDateController.text,
        ebookLink: _ebookLinkController.text,
        amazonLink: _amazonLinkController.text,
        professors: _professorsController.text.split(',').map((s) => s.trim()).toList(),
      );

      try {
        await BookService.addBook(widget.schoolId, widget.careerId, widget.courseId, newBook, newBook.name);
        Navigator.pop(context, newBook); // Return to the previous page with the new book data
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add book')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the book name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publishDateController,
                decoration: const InputDecoration(labelText: 'Publish Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the publish date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ebookLinkController,
                decoration: const InputDecoration(labelText: 'eBook Link'),
              ),
              TextFormField(
                controller: _amazonLinkController,
                decoration: const InputDecoration(labelText: 'Amazon Link'),
              ),
              TextFormField(
                controller: _professorsController,
                decoration: const InputDecoration(labelText: 'Professors (comma-separated)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
