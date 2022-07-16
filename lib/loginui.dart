import 'package:fabriapp/site_staff/home_staff.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController_ = TextEditingController();
    TextEditingController passwordController_ = TextEditingController();
    Future _logIn() async {
      try {
         await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController_.text,
                password: passwordController_.text);
        print("1");
      } on FirebaseAuthException catch (e) {
        print("2");
        if (e.code == 'user-not-found') {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(const SnackBar(content: Text('Invalid Details')));
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(const SnackBar(content: Text('Wrong Password')));
          print('No pp');
        } else if (e.code == 'invalid-email') {
          // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Invalid Email')));
          print('No  email.');
        } else {
          print('done');
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text('Data is Processing')));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeStaff()),
          );
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 900,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "  FabriApp",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      width: 60,
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
                          width: 35,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                // login form

                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController_,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: 'Enter valid mail id as abc@gmail.com'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            controller: passwordController_,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Minimum 8 Char & 1 Cap'),
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
                      ],
                    ),
                  ),
                ),

                //
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      _logIn();
                      print(emailController_.text);
                      print(passwordController_.text);
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         content: Text('Data is in processing.')));

                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
