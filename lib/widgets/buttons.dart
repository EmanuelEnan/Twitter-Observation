import 'package:flutter/material.dart';

import '../scrn/mobile_starting_page.dart';
import '../scrn/starting_page.dart';

ButtonStyle colorButton = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 0, 155, 155),
);

Widget landingButtons(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 0, 155, 155),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const StartingPage(),
        ),
      );
      // print(FirebaseAuth.instance.currentUser!.uid);
      // print(FirebaseFirestore.instance
      //     .collection('usersData')
      //     .doc('uid')
      //     .id);
    },
    child: const Padding(
      padding: EdgeInsets.all(14.0),
      child: Text(
        'Start Now - It\'s Free',
        style: TextStyle(fontSize: 22),
      ),
    ),
  );
}

Widget landingButtonsMobile(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 0, 155, 155),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MobileStartingPage(),
        ),
      );
      // print(FirebaseAuth.instance.currentUser!.uid);
      // print(FirebaseFirestore.instance
      //     .collection('usersData')
      //     .doc('uid')
      //     .id);
    },
    child: const Padding(
      padding: EdgeInsets.all(14.0),
      child: Text(
        'Start Now - It\'s Free',
        style: TextStyle(fontSize: 17),
      ),
    ),
  );
}
