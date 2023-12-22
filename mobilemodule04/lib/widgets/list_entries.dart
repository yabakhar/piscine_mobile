import 'package:flutter/material.dart';

import '../model/entrie.dart';
import 'entrie_card.dart';

class ListEntries extends StatelessWidget {
  const ListEntries({super.key, required this.entries});
  final List<Entrie> entries;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) {
        return EntrieCard(entrie: entries[index]);
      }),
      separatorBuilder: ((context, index) {
        return Container(height: 10);
      }),
      itemCount: entries.length,
    );
  }
}
