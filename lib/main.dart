import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:twitter_observation/scrn/responsive_page.dart';

import 'model/transaction.dart';

const String boxName = 'fact';
const String logName = 'twit';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter();
  // Hive.initFlutter;

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>(boxName);
  // await Hive.openBox(logName);

  // await Hive.openBox(boxName);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TwitObservation',
      darkTheme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                displayColor: Colors.white,
                bodyColor: Colors.white,
              ),
        ),
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: const ResponsivePage(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Lottie.asset('assets/117164-dancing-box.json',
//           width: 150, height: 150, fit: BoxFit.cover),
//       // nextScreen: const StartingPage(),
//       nextScreen: const LandingPage(),

//       // nextScreen: Hive.box(logName).get('fact') == null
//       //     ? const LoginPage()
//       //     : const StartingPage(),
//       splashTransition: SplashTransition.rotationTransition,
//       pageTransitionType: PageTransitionType.fade,
//     );
//   }
// }
