// ignore_for_file: unused_import, unused_field

import 'package:fabriapp/admin_staff/change_password.dart';
import 'package:fabriapp/admin_staff/company_directory.dart';
import 'package:fabriapp/admin_staff/create_account.dart';
import 'package:fabriapp/admin_staff/receive_requests.dart';
import 'package:fabriapp/directory.dart';
import 'package:fabriapp/loginui.dart';
import 'package:fabriapp/site_staff/dashboard.dart';
import 'package:fabriapp/site_staff/home_staff.dart';
import 'package:fabriapp/site_staff/sendrequest.dart';
import 'package:fabriapp/user_profile.dart';
import 'package:flutter/material.dart';

class OfficeStaffHome extends StatefulWidget {
  const OfficeStaffHome({Key? key}) : super(key: key);

  @override
  State<OfficeStaffHome> createState() => _OfficeStaffHomeState();
}

class _OfficeStaffHomeState extends State<OfficeStaffHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeStaff(),
    ReceiveRequests(),
    Sendrequest(),
    Directory(),
    UserProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Business',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ));
  }
}
