import 'package:flutter/material.dart';
import 'package:flutter_application_2/Matches_Database.dart';
import 'package:flutter_application_2/add_matches_screen.dart';
import 'package:flutter_application_2/matches_attrib.dart';

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  late List<TheMatches> matches = [];

  @override
  void initState() {
    super.initState();

    MyDb().getfromDb().then((data) {
      setState(() {
        matches = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'upcoming matches',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: matches.isEmpty
          ? Center(
              child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'no matches yet...',
                style: TextStyle(fontSize: 20),
              ),
            ))
          : ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Text(matches[i].firstTeam.toString()),
                    Text(matches[i].secondTeam.toString()),
                    Text(matches[i].duration.toString()),
                    Text(matches[i].location.toString()),
                    SizedBox(
                      height: 15,
                    )
                  ],
                );
              }),
    );
  }
}
