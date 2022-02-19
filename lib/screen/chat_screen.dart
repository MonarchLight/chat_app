import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("/Chats/oHWiNFxViwnYYICMEpqu/Messages/")
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnap) {
          if (streamSnap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnap.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[i]["Text"]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("/Chats/oHWiNFxViwnYYICMEpqu/Messages/")
              .add({
            "Text": "This was added by clicking",
          });
        },
      ),
    );
  }
}
