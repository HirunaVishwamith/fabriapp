import 'package:fabriapp/loginui.dart';
import 'package:fabriapp/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
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
                    'User Profile',
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(140),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    // backgroundImage: AssetImage(""),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: Text(
                    'User Name : ',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  child: Text(
                    'Mobile Number : ',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  child: Text(
                    'User Role : ',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 70),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const resetPassword()),
                      );
                    },
                    child: const Text("Change Password"),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _signOut();
                    },
                    child: const Text("Log Out"),
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
