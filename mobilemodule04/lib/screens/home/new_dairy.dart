import 'package:diaryapp/modelView/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/felling.dart';
import '../../widgets/create_description.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_text_from_field.dart';

class NewDairy extends StatelessWidget {
  const NewDairy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creact New Dairy"),
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
      ),
      body: Consumer<HomeModelView>(builder: (context, model, _) {
        return Container(
          padding: const EdgeInsets.all(8.8),
          color: Colors.deepPurpleAccent.withOpacity(0.5),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFromField(
                  controller: model.titleController,
                  description: "Title",
                ),
                const SizedBox(height: 10),
                CustomDropDown(
                  description: "Select a feeling",
                  dropdownValue: model.dropdownValue,
                  feelings: [
                    Feeling(iconName: "very_dissatisfied"),
                    Feeling(iconName: "dissatisfied"),
                    Feeling(iconName: "neutral"),
                    Feeling(iconName: "satisfied"),
                    Feeling(iconName: "very_satisfied"),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: CreateDescription(
                    descriptionController: model.textController,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    model.createDairy(
                      icon: model.dropdownValue,
                      title: model.titleController.text,
                      text: model.textController.text,
                    );
                  },
                  child: const CustomButton(
                    text: 'Create',
                    colorBackground: Colors.white,
                    textColor: Colors.deepPurple,
                    width: 300,
                    height: 70,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
