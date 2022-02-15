import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List<String> data = [
    "android",
    "windows",
    "mac",
    "linux",
    "parrotOS",
    "mint"
  ];

  List<String> recentSearch = [
    "Android",
    "Windows",
    "Mac",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(title: Text(query), onTap: () {});
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(title: Text("No results founds"), onTap: () {});
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentSearch[index]),
            trailing: Icon(Icons.arrow_back_ios),
            onTap: () {},
          );
        });
  }
}
