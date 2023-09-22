import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;
  AuthService authService;

  StorageService(this.authService);

  Future<String> uploadImage(File file) async {
    final user = authService.auth.currentUser;
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('profile_pictures/${user?.uid}.$ext');

    await ref
        .putFile(
          file,
          SettableMetadata(contentType: 'image/$ext'),
        )
        .then((p0) {});

    return await ref.getDownloadURL();
  }
}
