import 'package:flutter/material.dart';

class PercentageFeelCard extends StatelessWidget {
  const PercentageFeelCard({
    super.key,
    required this.color,
    required this.icon,
    required this.percentage,
  });
  final Color color;
  final double percentage;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(width: 10),
          Text(
            "${percentage.toStringAsFixed(2)}%",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
