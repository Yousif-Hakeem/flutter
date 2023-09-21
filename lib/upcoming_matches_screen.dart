import 'package:flutter/material.dart';
import 'package:flutter_application_2/Matches_Database.dart';

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  late MyDb db;
  @override
  void initState() {
    super.initState();
    db = MyDb();
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
        body: FutureBuilder(
          future: db.getfromDb(),
          builder: (context, snapShot) {
            var matches = snapShot.data;
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: matches!.length,
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
                  });
            }
          },
        ));
  }
}
