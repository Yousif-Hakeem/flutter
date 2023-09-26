import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/constants.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, '/add_matches');
              },
              icon: Icon(Icons.play_arrow_outlined))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage(
                'images/nero-devil-may-cry-5-uhdpaper.com-4K-119.jpg'),
          ),
          SizedBox(height: 18),
          const Text(
            'King Tryndamere',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(50.0, 15, 30, 0),
            child: Text(
              'famous for taking cs in all lanes  , Also my right ',
              style: TextStyle(
                  fontSize: 14, fontStyle: FontStyle.italic, letterSpacing: .5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(65.0, 0, 30, 50),
            child: Text(
              'arm is a lot stronger than my left arm.',
              style: TextStyle(
                  fontSize: 14, fontStyle: FontStyle.italic, letterSpacing: .5),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 100, right: 60),
                child: Text(
                  'followers',
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Text(
                      'following',
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 120),
                child: Text(
                  '1M',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      '0',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Total maps',
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'Total stories',
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Total likes',
                          style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 62),
                child: Text(
                  '59K',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 105),
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: Text(
                          '20M',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.deepPurple),
              child: const Text(
                'Follow',
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              ))
        ],
      ),
    );
  }
}
