// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mini_chat/core/firebase/auth_service.dart';
// import 'package:mini_chat/core/firebase/firestore_service.dart';
// import 'package:mini_chat/core/models/chat_user_model.dart';
// import 'package:mini_chat/core/models/message_model.dart';
//
// class ChatService {
//   final AuthService authService;
//   final FirestoreService firestoreService;
//
//   ChatService(this.authService, this.firestoreService);
//
//   String getConversationID(String id) {
//     final user = authService.auth.currentUser!;
//     return user.uid.hashCode <= id.hashCode
//         ? '${user.uid}_$id'
//         : '${id}_${user.uid}';
//   }
//
//   // for getting all messages of a specific conversation from firestore database
//   Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(ChatUser user) {
//     final user = authService.auth.currentUser!;
//     return firestoreService.firestore
//         .collection('chats/${getConversationID(user.uid)}/messages/')
//         .orderBy('sent', descending: true)
//         .snapshots();
//   }
//
//   // for sending message
//   Future<void> sendMessage(
//     ChatUser chatUser,
//     String msg,
//     Type type,
//     String uid,
//   ) async {
//     //message sending time (also used as id)
//     final time = DateTime.now().millisecondsSinceEpoch.toString();
//
//     //message to send
//     final Message message = Message(
//         toId: chatUser.id,
//         msg: msg,
//         read: '',
//         type: type,
//         fromId: uid,
//         sent: time);
//
//     final ref = firestoreService.firestore
//         .collection('chats/${getConversationID(chatUser.id)}/messages/');
//     await ref.doc(time).set(message.toJson()).then((value) =>
//         sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
//   }
//
//   //update read status of message
//   Future<void> updateMessageReadStatus(Message message) async {
//     firestoreService.firestore
//         .collection('chats/${getConversationID(message.fromId)}/messages/')
//         .doc(message.sent)
//         .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
//   }
//
//   //get only last message of a specific chat
//   Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(ChatUser user) {
//     firestoreService.firestore
//         .collection('chats/${getConversationID(user.id)}/messages/')
//         .orderBy('sent', descending: true)
//         .limit(1)
//         .snapshots();
//   }
//
//   //send chat image
//    Future<void> sendChatImage(ChatUser chatUser, File file) async {
//     //getting image file extension
//     final ext = file.path.split('.').last;
//
//     //storage file ref with path
//     final ref = storage.ref().child(
//         'images/${getConversationID(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext');
//
//     //uploading image
//     await ref
//         .putFile(file, SettableMetadata(contentType: 'image/$ext'))
//         .then((p0) {
//       log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
//     });
//
//     //updating image in firestore database
//     final imageUrl = await ref.getDownloadURL();
//     await sendMessage(chatUser, imageUrl, Type.image);
//   }
//
//   //delete message
//    Future<void> deleteMessage(Message message) async {
//     await firestoreService.firestore
//         .collection('chats/${getConversationID(message.toId)}/messages/')
//         .doc(message.sent)
//         .delete();
//
//     if (message.type == Type.image) {
//       await storage.refFromURL(message.msg).delete();
//     }
//   }
//
//   //update message
//    Future<void> updateMessage(Message message, String updatedMsg) async {
//     await firestoreService.firestore
//         .collection('chats/${getConversationID(message.toId)}/messages/')
//         .doc(message.sent)
//         .update({'msg': updatedMsg});
//   }
// }
