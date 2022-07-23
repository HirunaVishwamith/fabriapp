// ignore_for_file: unused_import, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabriapp/admin_staff/reqestlist.dart';
import 'package:fabriapp/loginui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ReceiveRequests extends StatefulWidget {
  const ReceiveRequests({Key? key}) : super(key: key);

  @override
  _ReceiveRequestsState createState() => _ReceiveRequestsState();
}

class _ReceiveRequestsState extends State<ReceiveRequests> {
  @override
  Widget build(BuildContext context) {
    // Future _msglist() async {
    //   FirebaseFirestore.instance
    //       .collection('request')
    //       .where('site_name', isEqualTo: "Admin")
    //       .get()
    //       .then((querySnapshot) => {
    //             print(querySnapshot.docs[0].data())
    //             // if (querySnapshot.docs[0].data()['site_name'].toString() ==
    //             //     'Admin Staff')
    //             //   {

    //             //   }
    //           });
    // }

    // _msglist();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //
                    const Text(
                      "  FabriApp",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 25,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                Container(
                  child: Text(
                    'Requests Received',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                RequstList(),
                //
              ],
            ),
          ),
          //
        ),
      ),
    );
  }
}
