import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat/firebase/firestore_service.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final firestore = FirestoreService();

  Future fetch() async {
    firestore.chats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: StreamBuilder(
        stream: firestore.chats.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (_, i) {
              final DocumentSnapshot documentSnapshot =
              streamSnapshot.data!.docs[i];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(documentSnapshot['ieLE7ck2Vl6EwwegMMME']['']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
