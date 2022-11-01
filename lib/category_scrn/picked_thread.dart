import 'package:flutter/material.dart';

import 'case_studies.dart';
import 'growth_fun.dart';
import 'growth_loops.dart';
import 'product_management.dart';

class PickedThread extends StatelessWidget {
  const PickedThread({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('category'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GrowthFun(),
                ));
              },
              child: const Text('Growth Hack'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GrowthLoops(),
                ));
              },
              child: const Text('Growth Loops'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CaseStudies(),
                ));
              },
              child: const Text('Case Studies'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductManager(),
                ));
              },
              child: const Text('Becoming a Product Manager'),
            ),
          ],
        ),
      ),
    );
  }
}
