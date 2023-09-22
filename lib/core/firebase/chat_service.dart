// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mini_chat/core/firebase/auth_service.dart';
// import 'package:mini_chat/models/chat_user_model.dart';
// import 'package:mini_chat/models/message_model.dart';
//
// class ChatService {
//   AuthService authService;
//
//   ChatService(this.authService);
//
//
//   String getConversationID(String id) => user.uid.hashCode <= id.hashCode
//       ? '${user.uid}_$id'
//       : '${id}_${user.uid}';
//
//   // for getting all messages of a specific conversation from firestore database
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
//       ChatUser user) {
//     return firestore
//         .collection('chats/${getConversationID(user.id)}/messages/')
//         .orderBy('sent', descending: true)
//         .snapshots();
//   }
//
//   // for sending message
//   static Future<void> sendMessage(
//     ChatUser chatUser,
//     String msg,
//     Type type,
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
//         fromId: user.uid,
//         sent: time);
//
//     final ref = firestore
//         .collection('chats/${getConversationID(chatUser.id)}/messages/');
//     await ref.doc(time).set(message.toJson()).then((value) =>
//         sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
//   }
//
//   //update read status of message
//   static Future<void> updateMessageReadStatus(Message message) async {
//     firestore
//         .collection('chats/${getConversationID(message.fromId)}/messages/')
//         .doc(message.sent)
//         .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
//   }
//
//   //get only last message of a specific chat
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
//       ChatUser user) {
//     return firestore
//         .collection('chats/${getConversationID(user.id)}/messages/')
//         .orderBy('sent', descending: true)
//         .limit(1)
//         .snapshots();
//   }
//
//   //send chat image
//   static Future<void> sendChatImage(ChatUser chatUser, File file) async {
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
//   static Future<void> deleteMessage(Message message) async {
//     await firestore
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
//   static Future<void> updateMessage(Message message, String updatedMsg) async {
//     await firestore
//         .collection('chats/${getConversationID(message.toId)}/messages/')
//         .doc(message.sent)
//         .update({'msg': updatedMsg});
//   }
// }
