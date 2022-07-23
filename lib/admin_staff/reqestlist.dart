// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequstList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequstList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('request').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['title']),
              subtitle: Text(data['discription']),
            );
          }).toList(),
        );
      },
    );
  }
}
