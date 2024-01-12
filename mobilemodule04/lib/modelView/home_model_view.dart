// ignore_for_file: use_build_context_synchronously

import 'package:diaryapp/model/felling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/entrie.dart';
import '../services/homeService.dart';

enum HomeStatus { loading, success, failure }

enum HomeDateStatus { loading, success, failure }

class HomeModelView extends ChangeNotifier {
  final HomeService homeService;
  HomeModelView({required this.homeService});
  HomeStatus? homeStatus;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  List<Entrie> entries = [];
  List<Entrie> entriesFiltred = [];
  Map<String, int> countTypes = {};
  String errorMessage = "";
  DateTime selectDay = DateTime.now();
  final titleController = TextEditingController();
  final textController = TextEditingController();
  String dropdownValue = "neutral";
  HomeDateStatus? homeDateStatus;
  Future<void> getDairy() async {
    entries.clear();
    homeStatusSetter = HomeStatus.loading;
    try {
      entries = await homeService.getDairy(
        email: auth.currentUser?.email ?? "",
      );
      countTypes = countType();
      homeStatusSetter = HomeStatus.success;
    } catch (e) {
      errorMessage = e.toString();
      homeStatusSetter = HomeStatus.failure;
    }
  }

  Future<void> getDairybyDate({required DateTime date}) async {
    homeDateStatusSetter = HomeDateStatus.loading;
    try {
      entriesFiltred.clear();
      entriesFiltred = await homeService.getByDateDairy(
        email: auth.currentUser?.email ?? "",
        date: date,
      );
      homeDateStatusSetter = HomeDateStatus.success;
    } catch (e) {
      errorMessage = e.toString();
      homeDateStatusSetter = HomeDateStatus.failure;
    }
  }

  Future<bool> createDairy({
    required String icon,
    required String title,
    required String text,
  }) async {
    final entrie = Entrie(
      date: DateTime.now(),
      userMail: auth.currentUser?.email ?? "",
      id: '',
      title: title,
      icon: icon,
      text: text,
      feeling: Feeling(iconName: icon),
    );
    try {
      await homeService.createDairy(entrie);
      titleController.clear();
      textController.clear();
      getDairy();
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    }
  }

  Future<void> deleteDairy(Entrie entrie) async {
    homeStatusSetter = HomeStatus.loading;
    try {
      await homeService.deleteDairy(entrie.id);
      homeStatusSetter = HomeStatus.loading;
      getDairy();
    } catch (e) {
      errorMessage = e.toString();
      homeStatusSetter = HomeStatus.failure;
    }
  }

  set homeStatusSetter(HomeStatus value) {
    homeStatus = value;
    notifyListeners();
  }

  set homeDateStatusSetter(HomeDateStatus value) {
    homeDateStatus = value;
    notifyListeners();
  }

  Map<String, int> countType() {
    final Map<String, int> types = {};
    for (var entry in entries) {
      types[entry.icon] = (types[entry.icon] ?? 0) + 1;
    }
    return types;
  }
}
