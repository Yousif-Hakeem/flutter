import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

String? email;
String? password;
GlobalKey<FormState> key = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white10,
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white10,
        body: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Email";
                      } else if (!value.contains('@gmail.com')) {
                        return 'wrong format';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        iconColor: Colors.deepOrange,
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
                        hintText: 'Enter email',
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: hide,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      if (value != null) password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter password";
                      } else if (value.length < 6) {
                        return 'password is too short';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        iconColor: Colors.deepOrange,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.deepOrange,
                          ),
                        ),
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
                        hintText: 'Enter password',
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () async {
                    bool valid = key.currentState!.validate();

                    if (valid == true) {
                      key.currentState!.save();

                      key.currentState!.reset();
                      print('email $email');
                      print('password $password');
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.setString('email', email!);
                      await preferences.setString('password', password!);
                      Navigator.pushNamed(context, HomeScreenPath);
                    } else {
                      //
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
