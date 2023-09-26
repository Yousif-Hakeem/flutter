import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Matches_Database.dart';
import 'package:flutter_application_2/matches_attrib.dart';

// import 'package:flutter_application_2/constants.dart';

class AddMatches extends StatefulWidget {
  const AddMatches({super.key});

  @override
  State<AddMatches> createState() => _MatchesState();
}

class _MatchesState extends State<AddMatches> {
  bool hasOnlyNonAlphabets(String input) {
    final alphabetsRegex = RegExp(r'[a-zA-Z]');
    return alphabetsRegex.hasMatch(input);
  }

  GlobalKey<FormState> newkey = GlobalKey<FormState>();
  TheMatches matches = TheMatches();
  late MyDb db;

  final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      content: AwesomeSnackbarContent(
        title: 'Great!',
        message: 'Match Added successfully!',
        titleFontSize: 19,
        messageFontSize: 14,
        contentType: ContentType.success,
      ));

  final FailSnackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: AwesomeSnackbarContent(
        title: 'Something went wrong!',
        message: 'could not add match',
        titleFontSize: 19,
        messageFontSize: 14,
        contentType: ContentType.failure,
      ));
  @override
  @override
  void initState() async {
    super.initState();
    db = MyDb();
    // await db.initializeDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Matches',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[900],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/upcoming_matches');
              },
              icon: const Icon(Icons.play_arrow_outlined))
        ],
      ),
      body: Form(
          key: newkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Flexible(
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
                    const SizedBox(
                      height: 10,
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
                      decoration:
                          InputDecoration(hintText: 'Enter second team'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        matches.duration = int.parse(value!);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter duration";
                        } else if (hasOnlyNonAlphabets(value)) {
                          return 'use only numbers for duration';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter duration'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          matches.location = value;
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
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () async {
                          bool valid = newkey.currentState!.validate();
                          if (valid == true) {
                            await db.insertData(matches);
                            newkey.currentState!.reset();
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(FailSnackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          textStyle: const TextStyle(fontSize: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                        ),
                        child: const Text('Add'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
