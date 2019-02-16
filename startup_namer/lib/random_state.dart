import 'package:flutter/material.dart';
import 'random_word_manager.dart';
import 'package:english_words/english_words.dart';

class RandomWordState extends State<RandomWordManager> {
  final _suggestions = <WordPair>[];
  final _biggerFonts = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      //The itemBuilder callback is called once per suggested word pairing,
      //and places each suggestion into a ListTile row.
      //For even rows, the function adds a ListTile row for the word pairing.
      //For odd rows, the function adds a Divider widget to visually separate the entries.
      //Note that the divider may be difficult to see on smaller devices.
      itemBuilder: (context, i) {
        //Add a one-pixel-high divider widget before each row in the ListView.
        if (i.isOdd) return Divider();
        //The expression i ~/ 2 divides i by 2 and returns an integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings in the ListView, minus the divider widgets.
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair suggestion) {
    return ListTile(
      title: Text(
        suggestion.asPascalCase,
        style: _biggerFonts,
      ),
    );
  }
}
