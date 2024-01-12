import 'package:flutter/material.dart';

import 'custom_buttom.dart';

class EmptyEntries extends StatelessWidget {
  const EmptyEntries({super.key, required this.isLoading});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (!isLoading)
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Try To get some OR create It",
                  width: 300,
                ),
                Text(
                  "No Dairy Entries",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
