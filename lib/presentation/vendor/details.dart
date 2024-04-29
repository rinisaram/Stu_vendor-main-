import 'package:flutter/material.dart';

// Mockup for a student profile page
class StudentProfilePage extends StatelessWidget {
  final String studentId;

  // Constructor requires a student ID
  StudentProfilePage({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, you might fetch student details from a database using the studentId
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Student ID: $studentId", style: TextStyle(fontSize: 20)),
            // SizedBox(height: 20),
            // Text("Name: ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("Department: Computer Science",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("Year: 3", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
