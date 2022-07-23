// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabriapp/dirlist.dart';
import 'package:fabriapp/loginui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Directory extends StatefulWidget {
  const Directory({Key? key}) : super(key: key);

  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  @override
  Widget build(BuildContext context) {
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
                    'Directory',
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
                dirList(),
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
