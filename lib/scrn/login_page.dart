import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:twitter_observation/main.dart';
import 'package:twitter_observation/scrn/starting_page.dart';
import 'package:twitter_observation/tokens.dart';

import '../model/transaction.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('twitter_login app'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Login with the Twitter',
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(160, 48)),
                  ),
                  onPressed: () async {
                    await loginV2();
                  },
                  child: const Text('using Twitter API v2.0'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Use Twitter API v2.
  Future loginV2() async {
    Tokens tokens = Tokens();
    final String apiKey = tokens.apiKey1;
    final String apiSecretKey = tokens.apiSecretKey1;
    String redirect = tokens.redirect;
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: apiKey,

      /// Consumer API Secret keys
      apiSecretKey: apiSecretKey,

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: redirect,
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.loginV2();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
        print('====== Login issue ======');
        break;
      case null:
        // error
        print('====== Login error ======');
        break;
    }

    // Hive.box(logName).put('cred', TwitterLoginStatus.loggedIn);

    if (authResult.status == TwitterLoginStatus.loggedIn) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const StartingPage()));
    }
  }
}
