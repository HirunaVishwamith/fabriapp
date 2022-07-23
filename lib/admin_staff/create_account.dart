import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabriapp/loginui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // var loading = false;
    String Role = "Site Worker";
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernController = TextEditingController();
    TextEditingController mobileController = TextEditingController();

    Future _signUp() async {
      // setState(() {
      //   loading = true;
      // });
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        await FirebaseFirestore.instance.collection('users').doc(emailController.text).set({
          'email': emailController.text,
          'mobile': mobileController.text,
          'password': passwordController.text,
          'site_name': Role,
          'user_name': usernController.text,


        });

        // ignore: unused_catch_clause
      } on FirebaseAuthException catch (e) {
        // _handleSignUpError(e);
        // setState(() {
        //   loading = false;
        // });
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
                    'Add User',
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
                // user name

                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a Profile Name',
                            labelText: 'User Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Profile Name';
                            }
                            return null;
                          },
                        ),
                        // mail
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Email Address',
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a email address';
                            }
                            return null;
                          },
                        ),
                        // role
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Site Name    ",
                              style: TextStyle(fontSize: 16),
                            ),
                            DropdownButton<String>(
                              value: Role,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              underline: Container(
                                height: 5,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              onChanged: (String? newValue) {
                                Role = newValue!;

                                // setState(() {
                                //   newValue;
                                // });
                              },
                              items: <String>[
                                "Site Worker",
                                'Admin Staff',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // mobile
                        TextFormField(
                          controller: mobileController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a Mobile Number',
                            labelText: 'Mobile',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            controller: passwordController,
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
                            }
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
                              _signUp();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Text('Data is in processing.')));
                              // if (_formKey.currentState!.validate()) {
                              //   // If the form is valid, display a Snackbar.
                              //
                              // }
                            },
                            child: const Text(
                              'Create',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        )
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
    // ignore: dead_code

    // void _handleSignUpError(FirebaseAuthException e){
    //   String messageToDisplay;
    //   switch(e.code){

    //   }
    // }
  }
}
