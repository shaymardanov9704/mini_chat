import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> userExists({required String uid}) async {
    return (await firestore.collection('users').doc(uid).get()).exists;
  }
}
