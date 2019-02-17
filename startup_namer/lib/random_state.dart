import 'package:flutter/material.dart';
import 'random_word_manager.dart';
import 'package:english_words/english_words.dart';

class RandomWordState extends State<RandomWordManager> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFonts = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
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
    final bool alreadySaved = _saved.contains(suggestion);
    return ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFonts,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFonts,
            ),
          );
        });
        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: const Text('Saved Suggestion'),
          ),
          body: new ListView(
            children: divided,
          ),
        );
      }),
    );
  }
}
