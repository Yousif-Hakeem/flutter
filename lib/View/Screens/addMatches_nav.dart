import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/Matches_Database.dart';
import 'package:flutter_application_2/Model/matches_attrib.dart';

import 'package:lottie/lottie.dart';

class AddMatchesNavBar extends StatefulWidget {
  const AddMatchesNavBar({super.key});

  @override
  State<AddMatchesNavBar> createState() => _AddMatchesNavBarState();
}

class _AddMatchesNavBarState extends State<AddMatchesNavBar> {
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
  void initState() {
    super.initState();
    db = MyDb();
    // await db.initializeDb();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: newkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Lottie.asset(
                      'assets/animation_ln1yc8fq.json',
                      height: 200.0,
                      repeat: true,
                      reverse: true,
                      animate: true,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        if (value != null) matches.firstTeam = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter first team/'s name";
                        } else {
                          return null;
                        }
                      },
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
                          hintText: 'Enter first team',
                          hintStyle: TextStyle(color: Colors.white30)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) matches.secondTeam = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter second team/'s name";
                      } else {
                        return null;
                      }
                    },
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
                        hintText: 'Enter second team',
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      if (value != null) matches.duration = int.parse(value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter duration";
                      } else if (hasOnlyNonAlphabets(value)) {
                        return 'use only numbers for duration';
                      }
                      return null;
                    },
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
                        hintText: 'Enter Duration',
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) matches.location = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter location";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      hintText: 'Enter location',
                      hintStyle: TextStyle(color: Colors.white30),
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
                          newkey.currentState!.save();
                          await db.insertData(matches);
                          newkey.currentState!.reset();
                          print('SAAAVED!');
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(FailSnackBar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        // disabledBackgroundColor: Colors.black,
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
        ));
  }
}
