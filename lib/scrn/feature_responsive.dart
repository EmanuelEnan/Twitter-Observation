import 'package:flutter/material.dart';
import 'package:twitter_observation/scrn/feature_dashboard.dart';

import 'package:twitter_observation/scrn/mobile_feature_dashboard.dart';

class FeatureResponsivePage extends StatelessWidget {
  const FeatureResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 800
        ? const Featuredashboard()
        : const MobileFeaturedashboard();
  }
}
