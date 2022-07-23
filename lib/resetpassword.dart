import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   emailcont.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final emailcont = TextEditingController();
    final passcont = TextEditingController();
    Future resetpass() async {
      //Create an instance of the current user.
      User? user = await FirebaseAuth.instance.currentUser!;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      if (user.email.toString() == emailcont.text) {
        final userdoc = users
            .doc(emailcont.text)
            .update({'password': passcont.text})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"));

        user.updatePassword(passcont.text).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password successfuly chancged')));
        }).catchError((error) {
          print("Password can't be changed" + error.toString());
          //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
        });
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Enter your email')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Reset Password"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Recieve an Email to\nreset your password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passcont,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcont,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  resetpass();
                },
                child: Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );

    // ignore: dead_code
  }
}
