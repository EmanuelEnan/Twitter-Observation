import 'package:flutter/material.dart';

import '../widgets/card_design.dart';

class GrowthLoops extends StatelessWidget {
  const GrowthLoops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth Loops'),
      ),
      body: Column(
        children: [
          cardDesign('"magical" growth loops', 'Lenny Rachitsky',
              'https://twitter.com/lennysan/status/1328739791567872001'),
          cardDesign('Flywheels', 'Lenny Rachitsky',
              'https://twitter.com/lennysan/status/1295743085243060224'),
        ],
      ),
    );
  }
}
