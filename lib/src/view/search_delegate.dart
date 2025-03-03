import 'package:flutter/material.dart';

class SearchDelegateWidget extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Tìm kiếm công việc';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: const Icon(Icons.mic),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Dọn chuồng'),
          leading: Icon(Icons.history),
          trailing: Icon(Icons.north_west),
          onTap: () {
            query = 'Dọn chuồng';
          },
        ),
        ListTile(
          title: Text('Cho ăn'),
          leading: Icon(Icons.history),
          trailing: Icon(Icons.north_west),
          onTap: () {
            query = 'Cho ăn';
          },
        ),
        ListTile(
          title: Text('Cho uống thuốc'),
          leading: Icon(Icons.history),
          trailing: Icon(Icons.north_west),
          onTap: () {
            query = 'Cho uống thuốc';
          },
        ),
      ],
    );
  }
}
