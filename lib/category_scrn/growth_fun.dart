import 'package:flutter/material.dart';

import '../widgets/card_design.dart';


class GrowthFun extends StatelessWidget {
  const GrowthFun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth Hack'),
      ),
      body: Column(
        children: [
          cardDesign('How to Drive Early Supply', 'Lenny Rachitsky',
              'https://twitter.com/lennysan/status/1198997647807275009'),
          cardDesign('Decoy Effect', 'Barrett Joneill',
              'https://twitter.com/barrettjoneill/status/1497950095228080137'),
        ],
      ),
    );
  }
}
