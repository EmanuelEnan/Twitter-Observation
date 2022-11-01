import 'package:flutter/material.dart';

import 'recent_search_info.dart';

class RecentSearchField extends StatelessWidget {
  RecentSearchField({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Write the term you want to search'),
            TextField(
              controller: _searchController,
            ),
            const SizedBox(
              height: 9,
            ),
            ElevatedButton(
              onPressed: () {
                var search = _searchController.text;
                search.isNotEmpty
                    ? Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              RecentSearchInfo(searchInfo: search),
                        ),
                      )
                    : Container();
              },
              child: const Text('search'),
            ),
          ],
        ),
      ),
    );
  }
}
