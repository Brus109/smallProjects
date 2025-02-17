import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fs_tweet/content/fs_admin_table.dart';

import '../content/item_public.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FsAdminTable()));
          }, icon: Icon(Icons.directions))
        ],
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance.collection("twett").where("public", isEqualTo: true),
        itemBuilder: (
          BuildContext context,
          QueryDocumentSnapshot<Map<String,dynamic>> document
        ){
            return ItemPublic(publicFData: document.data());
          }
        
      ),
      
      // agregar Firestore list view
    );
  }
}
