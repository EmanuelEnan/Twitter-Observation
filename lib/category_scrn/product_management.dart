import 'package:flutter/material.dart';

import '../widgets/card_design.dart';

class ProductManager extends StatelessWidget {
  const ProductManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Studies'),
      ),
      body: Column(
        children: [
          cardDesign('Why aim for mediocrity', 'Shreyas',
              'https://twitter.com/shreyas/status/1343630548355313664'),
          cardDesign('How PMs can address pushback from Designers', 'Joulee',
              'https://twitter.com/joulee/status/1503452971752849409'),
        ],
      ),
    );
  }
}
