import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference chats =
      FirebaseFirestore.instance.collection('chats');

  Future<void> create({
    required String username,
    required int id,
    required bool correct,
  }) async {
    await users.add({
      "username": username,
      "price": id,
    });
  }

  Future<void> delete({required String productId}) async {
    await users.doc(productId).delete();
  }

  Future<void> update({
    required String productId,
    required Map<String, dynamic> map,
  }) async {
    await users.doc(productId).update(map);
  }
}
