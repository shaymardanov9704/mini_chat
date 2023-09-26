import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_chat/core/firebase/firestore_service.dart';
import 'package:mini_chat/core/hive/user_hive.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

class AuthService {
  final FirestoreService firestoreService;
  final UserHive hive;
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthService(this.firestoreService, this.hive);

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

  Future signOut() async {
    await hive.clear();
    await auth.signOut();
  }

  Future<bool> userExists({required String uid}) async {
    return (await firestoreService.firestore.collection('users').doc(uid).get()).exists;
  }

  Future<void> fetchUser(String uid) async {
    // DocumentSnapshot<Map<String, dynamic>> snapshot =
    //     await firestoreService.firestore.collection('users').doc(uid).get();

    await hive.saveUserId(uid);
  }

  Future createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final user = auth.currentUser!;
    final chatUser = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      about: "Hey, I'm using We Chat!",
      image: user.photoURL.toString(),
      createdAt: time,
      isOnline: false,
      lastActive: time,
      pushToken: '',
    );

    await hive.saveUserId(user.uid);
    return await firestoreService.firestore
        .collection('users')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
