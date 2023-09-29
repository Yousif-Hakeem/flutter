import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';

import 'package:path/path.dart';

class EditMatchScreen extends StatefulWidget {
  final TheMatches match;

  const EditMatchScreen({Key? key, required this.match}) : super(key: key);

  @override
  _EditMatchScreenState createState() => _EditMatchScreenState();
}

class _EditMatchScreenState extends State<EditMatchScreen> {
  TextEditingController firstTeamController = TextEditingController();
  TextEditingController secondTeamController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstTeamController.text = widget.match.firstTeam ?? '';
    secondTeamController.text = widget.match.secondTeam ?? '';

    locationController.text = widget.match.location ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Match details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstTeamController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Edit first team',
                  hintStyle: TextStyle(color: Colors.deepOrange)),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: secondTeamController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Edit second team',
                  hintStyle: TextStyle(color: Colors.deepOrange)),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  hintText: 'Edit location',
                  hintStyle: TextStyle(color: Colors.deepOrange)),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                TheMatches updatedMatch = widget.match.copyWith(
                  firstTeam: firstTeamController.text,
                  secondTeam: secondTeamController.text,
                  location: locationController.text,
                );
                Navigator.pop(context, updatedMatch);
              },
              child: Text('Save'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}
