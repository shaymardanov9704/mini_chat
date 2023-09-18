import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference collections =
      FirebaseFirestore.instance.collection('products');

  final CollectionReference chats =
  FirebaseFirestore.instance.collection('chats');

  Future<void> create({
    required String name,
    required int id,
    required bool correct,
  }) async {
    await collections.add({
      "name": name,
      "price": id,
    });
  }

  // Future<void> fetch() async {
  //   final response = await collections.get();
  //   print(response);
  // }
  //
  // Future<void> fetchChats() async {
  //   final response = await collections.get();
  //   print(response);
  // }

  Future<void> delete({required String productId}) async {
    await collections.doc(productId).delete();
  }

  Future<void> update(
      {required String productId, required Map<String, dynamic> map}) async {
    await collections.doc(productId).update(map);
  }
}
