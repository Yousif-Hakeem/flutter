import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_matches_screen.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/profile.dart';
import 'package:flutter_application_2/upcoming_matches_screen.dart';

class Routing {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings) {
      // ignore: constant_pattern_never_matches_value_type
      case pfilePath:
        return MaterialPageRoute(builder: (context) => Profile());
      // ignore: constant_pattern_never_matches_value_type
      case matchesPath:
        return MaterialPageRoute(builder: (context) => AddMatches());
      // ignore: constant_pattern_never_matches_value_type
      case upcomingPath:
        return MaterialPageRoute(builder: (context) => UpcomingMatches());
    }
    return null;
  }
}
