import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Matches_Database.dart';
import 'package:flutter_application_2/matches_attrib.dart';

import 'package:flutter_application_2/constants.dart';

class AddMatches extends StatefulWidget {
  const AddMatches({super.key});

  @override
  State<AddMatches> createState() => _MatchesState();
}

class _MatchesState extends State<AddMatches> {
  TheMatches matches = TheMatches();
  late MyDb db;
  GlobalKey<FormState> newkey = GlobalKey<FormState>();
  final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: AwesomeSnackbarContent(
        title: 'Great!',
        message: 'Added successfully!',
        contentType: ContentType.success,
      ));
  @override
  void initState() {
    super.initState();
    db = MyDb();
    db.initializeDb();
  }

  @override
  Widget build(BuildContext context) {
    bool hasOnlyNonAlphabets(String input) {
      final alphabetsRegex = RegExp(r'[a-zA-Z]');
      return !alphabetsRegex.hasMatch(input);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, upcomingPath);
              },
              icon: Icon(Icons.play_arrow_outlined))
        ],
      ),
      body: Form(
          key: newkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      matches.firstTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter first team/'s name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Enter first team'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      matches.secondTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter second team/'s name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Enter second team'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      matches.duration = int.parse(value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter first team/'s name";
                      } else if (hasOnlyNonAlphabets(value)) {
                        return 'use only numbers for duration';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter duration (in minutes)'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      matches.firstTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter location";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: 'Enter location'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      bool valid = newkey.currentState!.validate();
                      if (valid == true) await db.insertData(matches);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      textStyle: TextStyle(fontSize: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
