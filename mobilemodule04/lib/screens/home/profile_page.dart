// ignore_for_file: use_build_context_synchronously

import 'package:diaryapp/modelView/home_model_view.dart';
import 'package:diaryapp/screens/home/new_dairy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/empty_entries.dart';
import '../../widgets/feel_for_felling.dart';
import '../../widgets/list_entries.dart';
import '../../widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModelView>(builder: (context, model, _) {
      if (model.homeStatus == HomeStatus.failure) {
        return const Center(child: Text("There is an Error"));
      }
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ProfileWidget(
                userInfo: model.auth.currentUser,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Your Last Diary Entries",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: (model.entries.isNotEmpty)
                  ? ListEntries(
                      entries: model.entries,
                    )
                  : InkWell(
                      onTap: () {
                        model.getDairy();
                      },
                      child: EmptyEntries(
                        isLoading: model.homeStatus == HomeStatus.loading,
                      ),
                    ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: FeelForFelling(
                countTypes: model.countTypes,
                entriesLength: model.entries.length,
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewDairy(),
                  ),
                );
              },
              child: const CustomButton(text: "New Diary Entry "),
            ),
          ],
        ),
      );
    });
  }
}
