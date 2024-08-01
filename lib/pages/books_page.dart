import 'package:flutter/material.dart';
import '../models/school.dart';
import '../services/school_service.dart';
import 'career_page.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  BooksPageState createState() => BooksPageState();
}

class BooksPageState extends State<BooksPage> {
  School? selectedSchool;
  List<School> schools = [];

  @override
  void initState() {
    super.initState();
    _loadSchools();
  }

  Future<void> _loadSchools() async {
    final String jsonString = await DefaultAssetBundle.of(context).loadString('courses_parsed.json');
    final Map<String, School> schoolMap = SchoolService.parseSchools(jsonString);
    setState(() {
      schools = schoolMap.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<School>(
              hint: const Text('Select a School'),
              value: selectedSchool,
              onChanged: (School? newValue) {
                setState(() {
                  selectedSchool = newValue;
                });
              },
              items: schools.map<DropdownMenuItem<School>>((School school) {
                return DropdownMenuItem<School>(
                  value: school,
                  child: Row(
                    children: [
                      Icon(school.icon),
                      const SizedBox(width: 10),
                      Text(school.name),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            selectedSchool != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: selectedSchool!.careers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(selectedSchool!.careers[index].name),
                          leading: const Icon(Icons.book),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CareerPage(career: selectedSchool!.careers[index], schoolId: selectedSchool!.schoolId),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : const Text('Please select a school to see the careers'),
          ],
        ),
      ),
    );
  }
}
