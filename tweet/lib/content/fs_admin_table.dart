import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class FsAdminTable extends StatelessWidget {
  FsAdminTable({Key? key}) : super(key: key);

  final tweetCollection = FirebaseFirestore.instance.collection('tweet');
  // TODO: agregar live Firestore query
  @override
  Widget build(BuildContext context) {
    // TODO: crear firebase data table
    return FirestoreDataTable(
      query: tweetCollection,
      columnLabels: {
        'descripcion':Text('Descripcion'),
        'osystem': Text('OS'),
        'picture':Text('Imagen'),
        'public': Text('Visible'),
        'username':Text('Usuario'),
        'stars':Text('likes'),
        'title':Text('Titulo'),
        'publishedAt':Text('Fecha')
      },
    );
  }
}
