import 'package:flutter/material.dart';

import 'package:twitter_observation/scrn/landing_page.dart';
import 'package:twitter_observation/scrn/landing_page_mobile.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? const LandingPage()
        : const LandingPageMobile();
  }
}
