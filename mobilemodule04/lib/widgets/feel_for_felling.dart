import 'package:diaryapp/helper/helper.dart';
import 'package:flutter/material.dart';
import 'percentage_feel_card.dart';

class FeelForFelling extends StatelessWidget {
  const FeelForFelling(
      {super.key, required this.countTypes, required this.entriesLength});
  final Map<String, int> countTypes;
  final int entriesLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.deepPurpleAccent),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurpleAccent.withOpacity(0.5),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Your Feel For Your Entries",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PercentageFeelCard(
                    icon: Icons.sentiment_dissatisfied_outlined,
                    color: Colors.orange,
                    percentage: Helper().getPercentage(
                      count: countTypes["dissatisfied"] ?? 0,
                      entriesLength: entriesLength,
                    ),
                  ),
                  const Divider(height: 0),
                  PercentageFeelCard(
                    icon: Icons.sentiment_very_dissatisfied_outlined,
                    color: Colors.red,
                    percentage: Helper().getPercentage(
                      count: countTypes["very_dissatisfied"] ?? 0,
                      entriesLength: entriesLength,
                    ),
                  ),
                  const Divider(height: 0),
                  PercentageFeelCard(
                    icon: Icons.sentiment_satisfied_alt_outlined,
                    color: Colors.green,
                    percentage: Helper().getPercentage(
                      count: countTypes["satisfied"] ?? 0,
                      entriesLength: entriesLength,
                    ),
                  ),
                  const Divider(height: 0),
                  PercentageFeelCard(
                    icon: Icons.sentiment_very_satisfied_outlined,
                    color: Colors.blue,
                    percentage: Helper().getPercentage(
                      count: countTypes["very_satisfied"] ?? 0,
                      entriesLength: entriesLength,
                    ),
                  ),
                  const Divider(height: 0),
                  PercentageFeelCard(
                    icon: Icons.sentiment_neutral_outlined,
                    color: Colors.yellow,
                    percentage: Helper().getPercentage(
                      count: countTypes["neutral"] ?? 0,
                      entriesLength: entriesLength,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
