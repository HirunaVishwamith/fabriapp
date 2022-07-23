import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class dirList extends StatefulWidget {
  const dirList({Key? key}) : super(key: key);

  @override
  State<dirList> createState() => _dirListState();
}

class _dirListState extends State<dirList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('directory').snapshots();

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
              title: Text(data['name']),
              subtitle: Text(data['contact_num'] + "\n" + data['company']),
              isThreeLine: true,
              minLeadingWidth : 10,
            );
          }).toList(),
        );
      },
    );
  }
}
