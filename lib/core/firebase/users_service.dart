import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';
import 'package:mini_chat/core/firebase/firestore_service.dart';
import 'package:mini_chat/core/firebase/storage_service.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

class UsersService {
  final FirestoreService firestoreService;
  final AuthService authService;
  final StorageService storageService;
  FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  UsersService(this.firestoreService, this.authService, this.storageService);

  ChatUser me = ChatUser.fromJson({});

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsersId() {
    final user = authService.auth.currentUser;
    return firestoreService.firestore
        .collection('users')
        .doc(user?.uid)
        .collection('my_users')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(
      List<String> userIds) {
    return firestoreService.firestore
        .collection('users')
        .where('id', whereIn: userIds.isEmpty ? [''] : userIds)
        .snapshots();
  }

  Future<List<ChatUser>> fetchAllUsers() async {
    List<ChatUser> users = [];
    final res = await firestoreService.firestore.collection('users').get();
    for (var doc in res.docs) {
      users.add(ChatUser.fromJson(doc.data()));
    }
    return users;
  }

  Future<List<ChatUser>> fetchMyUsers() async {
    final uid = authService.auth.currentUser!.uid;
    List<ChatUser> users = [];
    final res = await firestoreService.firestore
        .collection('users')
        .doc(uid)
        .collection('my_users')
        .get();
    for (var doc in res.docs) {
      final user = await fetchUser(doc.id);
      users.add(user);
    }
    return users;
  }

  Future<ChatUser> fetchUser(String uid) async {
    ChatUser user = ChatUser.fromJson({});
    final res = await firestoreService.firestore
        .collection('users')
        .where('id', isEqualTo: uid)
        .get();

    for (var doc in res.docs) {
     user = ChatUser.fromJson(doc.data());
    }
    return user;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(String uid) {
    return firestoreService.firestore
        .collection('users')
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  Future<ChatUser> getUserInformation(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> res =
        await firestoreService.firestore.collection('users').doc(uid).get();
    return ChatUser.fromJson(res.data() ?? {});
  }

  Future<void> updateUserInfo(String name, String about) async {
    final user = authService.auth.currentUser;
    await firestoreService.firestore.collection('users').doc(user?.uid).update({
      'name': name,
      'about': about,
    });
  }

  Future<void> updateProfilePicture(File file) async {
    final user = authService.auth.currentUser;

    final uploadImageUrl = await storageService.uploadImage(file);
    await firestoreService.firestore
        .collection('users')
        .doc(user?.uid)
        .update({'image': uploadImageUrl});
  }

  Future<void> updateActiveStatus(bool isOnline) async {
    final user = authService.auth.currentUser;
    firestoreService.firestore.collection('users').doc(user?.uid).update({
      'is_online': isOnline,
      'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
      'push_token': 'me.pushToken',

      ///TODO:
    });
  }

  Future<void> getSelfInfo() async {
    final user = authService.auth.currentUser;
    await firestoreService.firestore
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        await getFirebaseMessagingToken();

        updateActiveStatus(true);
      } else {
        await authService.createUser().then((value) => getSelfInfo());
      }
    });
  }

  Future<void> getFirebaseMessagingToken() async {
    await fMessaging.requestPermission();

    await fMessaging.getToken().then(
      (t) {
        if (t != null) {
          me.pushToken = t;
        }
      },
    );
  }

// static Future<List<ChatUser>> fetchUsers() async {
//   List<ChatUser> userList = [];
//   QuerySnapshot<Map<String, dynamic>> snapshot =
//       await firestore.collection("users").get();
//   for (var doc in snapshot.docs) {
//     userList.add(ChatUser.fromJson(doc.data()));
//   }
//   print(userList.length);
//   return userList;
// }
}
