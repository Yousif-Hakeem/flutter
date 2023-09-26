import 'package:flutter/material.dart';
import 'package:flutter_application_2/Matches_Database.dart';
// import 'package:flutter_application_2/add_matches_screen.dart';
import 'package:flutter_application_2/matches_attrib.dart';

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  List<TheMatches> matches = [];
  late MyDb db = MyDb();

  @override
  void initState() {
    // db.initializeDb();
    super.initState();
    db = MyDb();
    loadMatches();
  }

  Future<void> loadMatches() async {
    await db.initializeDb();
    List<TheMatches> data = await db.getFromDb();
    setState(() {
      matches = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcoming Matches',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: matches.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'No matches yet...',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          : ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100, top: 15, bottom: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(matches[index].firstTeam.toString()),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text(
                                'VS',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text('${matches[index].duration.toString()} am'),
                            Text(matches[index].location.toString()),
                          ],
                        ),
                        Text(matches[index].secondTeam.toString()),
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            iconSize: 20,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
