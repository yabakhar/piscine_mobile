import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.width = 250,
    this.height = 50,
    this.colorBackground = Colors.deepPurpleAccent,
    this.textColor = Colors.deepPurple,
  });
  final String text;
  final double width;
   final double height;
  final Color textColor;
  final Color colorBackground;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorBackground.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
