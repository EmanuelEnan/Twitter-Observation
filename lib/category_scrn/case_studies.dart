import 'package:flutter/material.dart';

import '../widgets/card_design.dart';

class CaseStudies extends StatelessWidget {
  const CaseStudies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Studies'),
      ),
      body: Column(
        children: [
          cardDesign('The downfall of Yahoo ', 'Gaurav Agarwal',
              'https://twitter.com/agarwal__gaurav/status/1500111554456420362'),
          cardDesign('How Coca-Cola created a drink to FAIL ', 'Gaurav Agarwal',
              'https://twitter.com/agarwal__gaurav/status/1513878546535624713'),
        ],
      ),
    );
  }
}
