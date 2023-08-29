import 'package:flutter/material.dart';

class MealSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'a',
    'ab',
    'abc',
    'abcd',
    'abcde',
    'abcdef',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchedQuery = [];
    for (var meals in searchTerms) {
      if (meals.toLowerCase().contains(query.toLowerCase())) {
        matchedQuery.add(meals);
      }
    }
    return ListView.builder(
      itemCount: matchedQuery.length,
      itemBuilder: (context, index) {
        var result = matchedQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchedQuery = [];
    for (var meals in searchTerms) {
      if (meals.toLowerCase().contains(query.toLowerCase())) {
        matchedQuery.add(meals);
      }
    }
    return ListView.builder(
      itemCount: matchedQuery.length,
      itemBuilder: (context, index) {
        var result = matchedQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
