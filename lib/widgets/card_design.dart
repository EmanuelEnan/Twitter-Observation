import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

Widget cardDesign(String title, String author, String tweet) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Topic: $title',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              'Thread writer: $author',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse(tweet),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text('go to the thread'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
