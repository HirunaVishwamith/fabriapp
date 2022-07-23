import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabriapp/loginui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CompanyDirectory extends StatefulWidget {
  const CompanyDirectory({Key? key}) : super(key: key);

  @override
  _CompanyDirectoryState createState() => _CompanyDirectoryState();
}

class _CompanyDirectoryState extends State<CompanyDirectory> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController namecont = TextEditingController();
    TextEditingController compcont = TextEditingController();
    TextEditingController contactcont = TextEditingController();
    Future _addContact() async {
      try {
        await FirebaseFirestore.instance.collection('directory').add({
          'name': namecont.text,
          'company': compcont.text,
          'contact_num': contactcont.text
        });

        // ignore: unused_catch_clause
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

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
                    'Add Contact',
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
                //
                // mobile
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: namecont,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Name',
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: compcont,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a Company Name',
                            labelText: 'Company',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Company';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: contactcont,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Contact Number',
                            labelText: 'Contact Number',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Contact Number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                _addContact();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Data is in processing.')));
                              }
                            },
                            child: const Text(
                              'Add to Directory',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
        ),
      ),
    );
  }
}
