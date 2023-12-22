import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateDescription extends StatelessWidget {
  const CreateDescription({super.key, required this.descriptionController});
  final TextEditingController descriptionController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Write a Detailed Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: TextFormField(
            controller: descriptionController,
            minLines: 8,
            inputFormatters: [
              LengthLimitingTextInputFormatter(200),
            ],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.3),
                  width: 1.5,
                  style: BorderStyle.none,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.3),
                  width: 1.5,
                  style: BorderStyle.none,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
            style: const TextStyle(
              color: Colors.deepPurple,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        )
      ],
    );
  }
}
