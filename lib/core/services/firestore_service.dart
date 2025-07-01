import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutrotional_tracking_app/core/models/user_model.dart';
import 'package:nutrotional_tracking_app/core/services/data_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future getData({
    required String path,
    String? documentId,
  }) async {
    if (documentId != null) {
      DocumentSnapshot<Map<String, dynamic>> data =
      await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      QuerySnapshot<Map<String, dynamic>> data =
      await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> data =
    await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  Future<void> saveUserProfile(UserModel user) async {
    await firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUserProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    } else {
      return null;
    }
  }
}
