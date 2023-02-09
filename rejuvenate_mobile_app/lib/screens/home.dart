import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";

  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/Logo.jpg',
                  width: 300,
                  height: 130,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              mainAxisSize: MainAxisSize.max,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Face and Body Retouching',
                  style:
                      GoogleFonts.patrickHand(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/Home.png',
                  height: 250,
                  width: 500,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(246, 86, 203, 209),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account?',
                  style: GoogleFonts.notoSansAdlam(
                      fontSize: 20, color: Colors.grey),
                ),
                TextButton(
                  child: Text(
                    'Login',
                    style: GoogleFonts.notoSansAdlam(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        color: const Color.fromARGB(246, 86, 203, 209)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
