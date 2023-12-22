import 'package:flutter/material.dart';

import '../model/felling.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    this.descriptionsize = 16,
    this.height = 110,
    this.description,
    required this.dropdownValue,
    required this.feelings,
  }) : super(key: key);

  final double? descriptionsize;
  final double height;
  final String? description;
  String dropdownValue;
  final List<Feeling> feelings;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.description ?? "",
            style: TextStyle(
              fontSize: widget.descriptionsize,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.deepPurple),
              ),
              child: DropdownButton<Feeling>(
                value: widget.feelings.firstWhere(
                  (feeling) => feeling.iconName == widget.dropdownValue,
                ),
                underline: Container(),
                padding: const EdgeInsets.all(8),
                elevation: 0,
                iconSize: 26,
                isExpanded: true,
                items: widget.feelings.map<DropdownMenuItem<Feeling>>(
                  (Feeling feeling) {
                    return DropdownMenuItem<Feeling>(
                      value: feeling,
                      child: Row(
                        children: [
                          Icon(
                            feeling.getIcon(),
                            color: feeling.getColor(),
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            feeling.iconName,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
                onChanged: (Feeling? newValue) {
                  setState(() {
                    widget.dropdownValue = newValue!.iconName;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
