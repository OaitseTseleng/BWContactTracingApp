import 'package:bw_contact_tracing_app/pages/permit_page.dart';
import 'package:bw_contact_tracing_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:bw_contact_tracing_app/pages/home_page.dart';
import 'package:bw_contact_tracing_app/pages/test_page.dart';
import 'package:bw_contact_tracing_app/pages/scan_page.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var location;
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    await Location().getCurrentLocation();
  }

  int _selectedTab = 0;
  final _pageOptions = [
    HomePage(),
    TestPage(),
    ScanPage(),
    PermitPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BW Contract Tracing App'),
        ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.message),
              title: Text('Test'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.code),
              title: Text('Scan'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.perm_identity),
              title: Text('Permit'),
            ),
          ],
        ),
      ),
    );
  }
}
