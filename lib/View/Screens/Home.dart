import 'package:flutter/material.dart';
import 'package:flutter_application_2/View/Screens/Upcoming_Nav.dart';
import 'package:flutter_application_2/View/Screens/addMatches_nav.dart';
import 'package:flutter_application_2/View/Screens/profile_nav_bar.dart';
import 'package:flutter_application_2/View/Screens/upcoming_matches_screen.dart';
import 'package:flutter_application_2/ViewModel/cubit/indicitor_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> screens = [
    ProfileNavigationBar(),
    AddMatchesNavBar(),
    UpcomingMatches()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GestureDetector(
            onTap: () {},
            child: const ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Icon(Icons.person),
              title: Text('profile'),
              hoverColor: Colors.deepOrange,
            ),
          ),
        ),
        backgroundColor: Colors.white10,
      ),
      backgroundColor: Colors.white10,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Game Night',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<IndicitorCubit, IndicitorState>(
        builder: (context, state) {
          return screens[state.index];
        },
      ),
      bottomNavigationBar: BlocBuilder<IndicitorCubit, IndicitorState>(
        builder: (context, state) {
          return BottomNavigationBar(
              unselectedItemColor: Colors.white30,
              backgroundColor: Colors.white10,
              currentIndex: state.index,
              onTap: (index) {
                // IndicitorCubit().setIndex(index);
                context.read<IndicitorCubit>().setIndex(index);
              },
              selectedItemColor: Colors.deepOrange,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline_sharp),
                    label: 'add Matches'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.lan_sharp), label: 'Upcoming Matches')
              ]);
        },
      ),
    );
  }
}
