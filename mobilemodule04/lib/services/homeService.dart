import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/entrie.dart';

class HomeService {
  final CollectionReference entrieCollection =
      FirebaseFirestore.instance.collection('dairy');

  Future<List<Entrie>> getDairy({required String email}) async {
    List<Entrie> entrie = [];
    try {
      QuerySnapshot querySnapshot =
          await entrieCollection.where('userMail', isEqualTo: email).get();
      for (var doc in querySnapshot.docs) {
        entrie.add(Entrie.fromSnapshot(doc));
      }
      return entrie;
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<List<Entrie>> getByDateDairy({
    required String email,
    required DateTime date,
  }) async {
    List<Entrie> entrie = [];
    try {
      QuerySnapshot querySnapshot = await entrieCollection
          .where('userMail', isEqualTo: email)
          .where('date', isEqualTo: date)
          .get();
      for (var doc in querySnapshot.docs) {
        entrie.add(Entrie.fromSnapshot(doc));
      }
      return entrie;
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<bool> createDairy(Entrie entrie) async {
    try {
      await entrieCollection.add(entrie.toJson());
      return true;
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<bool> deleteDairy(String entrieId) async {
    try {
      await entrieCollection.doc(entrieId).delete();
      return true;
    } catch (error) {
      return Future.error(error);
    }
  }
}
