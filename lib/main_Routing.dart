import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_matches_screen.dart';
import 'package:flutter_application_2/profile.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:flutter_application_2/upcoming_matches_screen.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => const ProfileScreen(),
      '/add_matches': (context) => const AddMatches(),
      '/upcoming_matches': (context) => const UpcomingMatches(),
    },
  ));
}






// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 // navigatorKey: navigatorKey,





// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/add_matches_screen.dart';
// import 'package:flutter_application_2/profile.dart';
// import 'package:flutter_application_2/routes.dart';
// import 'package:flutter_application_2/upcoming_matches_screen.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     onGenerateRoute: Routing.generateRoute,
//   ));
// }

// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(  
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: Routing.generateRoute,
//     );
//   }
// }
