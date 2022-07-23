import 'package:fabriapp/loginui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
                    'Change Password',
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
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter the Mail Address',
                            labelText: 'Mail',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the mail address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Minimum 8 Char & 1 Cap',
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              RegExp regex =
                                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!regex.hasMatch(value)) {
                                  return 'Enter valid password';
                                } else {
                                  return null;
                                }
                              }
                            }),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Data is in processing.')));
                              }
                            },
                            child: const Text(
                              'Change Password',
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
