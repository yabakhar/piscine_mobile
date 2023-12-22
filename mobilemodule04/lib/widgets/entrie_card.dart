import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../model/entrie.dart';
import 'display_entris.dart';

class EntrieCard extends StatelessWidget {
  const EntrieCard({super.key, required this.entrie});
  final Entrie entrie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.deepPurple,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Icon(
              entrie.feeling.getIcon(),
              color: entrie.feeling.getColor(),
              size: 60,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    entrie.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  Text(
                    Helper().convertDate(entrie.date),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              bottomDetailsSheet(context, entrie);
            },
            icon: Icon(
              Icons.open_in_browser,
              color: Colors.deepPurpleAccent.withOpacity(0.5),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

void bottomDetailsSheet(BuildContext context, Entrie entrie) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return DisplayEntries(entrie: entrie);
    },
  );
}
