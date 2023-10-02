import 'package:flutter/material.dart';

class ProfileNavigationBar extends StatefulWidget {
  const ProfileNavigationBar({super.key});

  @override
  State<ProfileNavigationBar> createState() => _ProfileNavigationBarState();
}

class _ProfileNavigationBarState extends State<ProfileNavigationBar> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const CircleAvatar(
          radius: 70.0,
          backgroundImage:
              AssetImage('images/nero-devil-may-cry-5-uhdpaper.com-4K-119.jpg'),
        ),
        SizedBox(height: 18),
        const Text(
          'King Tryndamere',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(50.0, 15, 30, 0),
          child: Text(
            'famous for taking cs in all lanes  , Also my right ',
            style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: .5,
                color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(65.0, 0, 30, 50),
          child: Text(
            'arm is a lot stronger than my left arm.',
            style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: .5,
                color: Colors.white),
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
                    letterSpacing: 1,
                    color: Colors.white),
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
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 120),
              child: Text(
                counter.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Text(
                    '0',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    letterSpacing: 1,
                    color: Colors.white),
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
                        letterSpacing: 1,
                        color: Colors.white),
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
                            letterSpacing: 1,
                            color: Colors.white),
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
                    letterSpacing: 1,
                    color: Colors.white),
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
                        letterSpacing: 1,
                        color: Colors.white),
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
                            letterSpacing: 1,
                            color: Colors.white),
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
            onPressed: () {
              setState(() {
                counter++;
              });
              ;
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text(
              'Follow',
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ))
      ],
    );
  }
}
