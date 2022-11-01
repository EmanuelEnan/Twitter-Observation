import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:url_launcher/link.dart';

import '../main.dart';
import '../model/transaction.dart';

class SaveFolder extends StatefulWidget {
  const SaveFolder({Key? key}) : super(key: key);

  // final String? data;
  // final String? id;

  @override
  State<SaveFolder> createState() => _SaveFolderState();
}

class _SaveFolderState extends State<SaveFolder> {
  // final saveBox = Hive.box('transactions');

  // @override
  // void initState() {
  //   super.initState();
  //   saveBox = Hive.box('transactions');
  //   print('saves: ${saveBox.values}');
  // }

  // @override
  // void dispose() {
  //   Hive.box('rush').close();
  //   super.dispose();
  //   print('disposed');
  // }

  // Box myBox = Hive.box(boxName);

  // late List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    // String tweet = widget.data.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('save'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Transaction>(boxName).listenable(),
        builder: (context, box, _) {
          if (Hive.box<Transaction>(boxName).values.isEmpty) {
            return const Center(
              child: Text('no data'),
            );
          }
          return ListView.builder(
            itemCount: Hive.box<Transaction>(boxName).length,
            itemBuilder: (context, index) {
              // final transactions = box.getAt(index) as Transaction;
              int itemCount = Hive.box<Transaction>(boxName).length;
              int reversedIndex = itemCount - 1 - index;
              final transactions = Hive.box<Transaction>(boxName)
                  .values
                  .toList()
                  .reversed
                  .toList();

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        (index + 1).toString(),
                      ),
                      Text(
                        // transactions.dateTime,
                        transactions[index].tweet!,

                        // Hive.box(boxName).getAt(index),
                      ),
                      // Text(
                      //   // transactions.dateTime,
                      //   transactions[index].link!,

                      //   // Hive.box(boxName).getAt(index),
                      // ),
                      const SizedBox(height: 10),

                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(transactions[index].link!),
                        builder: (context, followLink) => TextButton(
                          onPressed: followLink,
                          child: const Text('go to the tweet'),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     await Hive.box('transactions').getAt(index);
                      //     print('go to the tweet');
                      //   },
                      //   child: const Text('delete'),
                      // ),

                      ElevatedButton(
                        onPressed: () async {
                          await Hive.box<Transaction>(boxName)
                              .deleteAt(reversedIndex);
                          // setState(() {});
                          print('deleted');
                        },
                        child: const Text('delete'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
