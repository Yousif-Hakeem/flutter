import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/routes.dart';

import 'package:path/path.dart';

// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application_2/routes.dart';
// import 'package:flutter_application_2/score_screen.dart';
// import 'package:flutter_application_2/Score_counter.dart';
void main() {
  runApp(
    // MultiProvider(
    // providers: [
    //   ChangeNotifierProvider(create: (context) => ScoreCounterProvider())
    // ],
    // child:
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Login(),
      routes: <String, WidgetBuilder>{
        // '/': (context) => const ProfileScreen(),
        // '/': (context) => const Login(),
        // '/home': (context) => const Home(),

        // '/add_matches': (context) => const AddMatches(),
        // '/upcoming_matches': (context) => const UpcomingMatches(),
      },
      onGenerateRoute: Routing.generateRoute,
    ),
  );
  // )
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
