import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.color = Colors.white,
    this.descriptionsize = 16,
    this.height = 115,
    required this.controller,
    this.validator,
    this.textInputType,
    this.hint,
    this.inputLength = 20,
    this.description,
  });
  final Color color;
  final String? hint;
  final double? descriptionsize;
  final double height;
  final int inputLength;
  final String? description;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description ?? "",
            style: TextStyle(
              fontSize: descriptionsize,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (description != null) const SizedBox(height: 5),
          Expanded(
            child: TextFormField(
              validator: validator,
              controller: controller,
              onEditingComplete: () => TextInput.finishAutofillContext(),
              textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(inputLength),
              ],
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: textInputType,
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
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
