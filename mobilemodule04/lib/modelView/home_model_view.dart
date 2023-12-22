import 'package:diaryapp/model/felling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/entrie.dart';
import '../services/homeService.dart';

enum HomeStatus { loading, success, failure }

enum HomeCreationStatus { loading, success, failure }

class HomeModelView extends ChangeNotifier {
  final HomeService homeService;
  HomeModelView({required this.homeService}) {
    getDairy();
  }
  HomeStatus? homeStatus;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Entrie> entries = [];
  Map<String, int> countTypes = {};
  String errorMessage = "";
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final String dropdownValue = "neutral";

  Future<void> getDairy() async {
    homeStatusSetter = HomeStatus.loading;
    try {
      entries = await homeService.getDairy(
        email: _auth.currentUser?.email ?? "",
      );
      countTypes = countType();
      homeStatusSetter = HomeStatus.loading;
    } catch (e) {
      errorMessage = e.toString();
      homeStatusSetter = HomeStatus.failure;
    }
  }

  Future<void> createDairy({
    required String icon,
    required String title,
    required String text,
  }) async {
    final entrie = Entrie(
      date: DateTime.now(),
      userMail: _auth.currentUser?.email ?? "",
      id: '',
      title: title,
      icon: icon,
      text: text,
      feeling: Feeling(iconName: icon),
    );
    homeStatusSetter = HomeStatus.loading;
    try {
      await homeService.createDairy(entrie);
      homeStatusSetter = HomeStatus.success;
      getDairy();
    } catch (e) {
      errorMessage = e.toString();
      homeStatusSetter = HomeStatus.failure;
    }
  }

  Future<void> deleteDairy(String id) async {
    homeStatusSetter = HomeStatus.loading;
    try {
      await homeService.deleteDairy(id);
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

  Map<String, int> countType() {
    final Map<String, int> types = {};
    for (var entry in entries) {
      types[entry.icon] = (types[entry.date] ?? 0) + 1;
    }
    return types;
  }
}
