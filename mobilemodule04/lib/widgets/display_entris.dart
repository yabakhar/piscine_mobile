import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../model/entrie.dart';

class DisplayEntries extends StatelessWidget {
  const DisplayEntries({super.key, required this.entrie});
  final Entrie entrie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DsplyEntriesChild(
              titile: "Time",
              value: Helper().convertDate(entrie.date),
            ),
            DsplyEntriesChild(
              titile: "Feeling",
              value: "",
              isIcon: true,
              icon: entrie.feeling.getIcon(),
              color: entrie.feeling.getColor(),
            ),
            DsplyEntriesChild(
              titile: "Title",
              value: entrie.title,
            ),
            DsplyEntriesChild(
              titile: "Text",
              value: entrie.text,
            ),
          ],
        ),
      ),
    );
  }
}

class DsplyEntriesChild extends StatelessWidget {
  const DsplyEntriesChild({
    super.key,
    required this.titile,
    required this.value,
    this.isIcon = false,
    this.icon,
    this.color,
  });
  final String titile;
  final String value;
  final bool isIcon;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              titile,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: (!isIcon)
                ? Text(
                    value,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w400),
                  )
                : Icon(
                    icon,
                    size: 40,
                    color: color,
                  ),
          ),
        ],
      ),
    );
  }
}
