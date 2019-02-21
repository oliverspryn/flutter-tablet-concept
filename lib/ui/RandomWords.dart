import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int indexWithoutDivider = i ~/ 2;

        if (indexWithoutDivider >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[indexWithoutDivider]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final rows = _saved.map((WordPair pair) {
          return ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });

        final List<Widget> divided = ListTile.divideTiles(
          context: context,
          tiles: rows,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }
}
