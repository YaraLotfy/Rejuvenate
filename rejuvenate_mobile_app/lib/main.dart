import 'package:flutter/material.dart';
import 'screens/editprofile.dart';
import 'screens/viewprofile.dart';

import 'screens/patientreport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rejuvenate',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: EditProfile.routeName,
      initialRoute: ViewProfile.routeName,
      routes: {
        EditProfile.routeName: (context) => const EditProfile(),
        ViewProfile.routeName: (context) => const ViewProfile(),
        PatientReport.routeName: (context) => const PatientReport(),
      },
    );
  }
}
