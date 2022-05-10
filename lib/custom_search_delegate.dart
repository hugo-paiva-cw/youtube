import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, 'oi');
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      var list = [query ,'Android', 'Android navegação', 'IOS', 'Jogos']
          .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () {
                close(context, list[index]);
              },
            );
          });
    } else {
      return const Center(
        child: Text('Type something funny'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      List<String> list = [query ,'Android', 'Android navegação', 'IOS', 'Jogos']
          .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () {
                close(context, list[index]);
              },
            );
          });
    } else {
      return const Center(
        child: Text('Type something funny'),
      );
    }
  }
}
