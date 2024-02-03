import 'package:bloc_consume_api/models/quote_model.dart';
import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final QuoteModel quote;
  final Function() onRefresh;
  const QuoteWidget({super.key, required this.quote, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    quote.content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Author: ${quote.author}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Tags:\n${tagsToString(quote.tags)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: onRefresh,
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text('Load a new quote'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

String tagsToString(List<String> tags) {
  String tagsString = '';
  for (String tag in tags) {
    tagsString += ' $tag -';
  }
  return tagsString.substring(0, tagsString.length - 1);
}
