import 'package:fabriapp/loginui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Sendrequest extends StatefulWidget {
  const Sendrequest({Key? key}) : super(key: key);

  @override
  _SendrequestState createState() => _SendrequestState();
}

class _SendrequestState extends State<Sendrequest> {
  //Initially color is set to yellow which will be changed when button is pressed
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = "Admin";
  String siteName = "Site";
// date
  DateTime selectedDate = DateTime.now();
  bool showDate = false;
// file upload
  PlatformFile? pickedFile;

  // Future uploadFile() async {
  // final path = 'files/user_name';
  //  final file = File(pickedFile!.path!);

  //  final ref = FirebaseStorage.instance.ref().child(path);
  //  ref.putFile(file);
//  }

  Future chooseImage() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

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
                    'Send Request',
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
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter the Title',
                              labelText: 'Title',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Title';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Send to    ",
                                style: TextStyle(fontSize: 16),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                underline: Container(
                                  height: 5,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Admin',
                                  'Two',
                                  'Free',
                                  'Four'
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

                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'What you need?',
                              labelText: 'Description',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter valid description';
                              }
                              return null;
                            },
                          ),
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
                                value: siteName,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                underline: Container(
                                  height: 5,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    siteName = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Site',
                                  'Two',
                                  'Free',
                                  'Four'
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

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                _selectDate(context);
                                showDate = true;
                              },
                              child: const Text("Due Date"),
                            ),
                          ),

                          showDate
                              ? Center(child: Text(getDate()))
                              : const SizedBox(),
                          //
                          Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                if (pickedFile != null)
                                  //         Expanded(
                                  //         child: Container(
                                  //         color: Colors.blue[100],
                                  //       child: Image.file(
                                  //       File(pickedFile!.path!),
                                  //     width: double.infinity,
                                  //   fit: BoxFit.cover,
                                  //          ),
                                  //      ),
                                  //  ),
                                  if (pickedFile == null)
                                    // ignore: avoid_unnecessary_containers
                                    Container(
                                      child: MaterialButton(
                                        onPressed: chooseImage,
                                        child: const Text("Choose Image"),
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        textColor: Colors.white,
                                      ),
                                    ),
                                if (pickedFile != null)
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: MaterialButton(
                                      onPressed: () {
                                        //               uploadFile();
                                      },
                                      child: const Text("Upload"),
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      textColor: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          //
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 150.0, top: 40.0),
                              child: ElevatedButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  // It returns true if the form is valid, otherwise returns false
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Data is in processing.')));
                                  }
                                },
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          //
        ),
      ),
    );
  }
}
