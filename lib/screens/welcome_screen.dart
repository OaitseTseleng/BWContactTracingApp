import 'package:flutter/material.dart';
import 'package:bw_contact_tracing_app/widgets/startup_walkthrough.dart';
import 'package:bw_contact_tracing_app/screens/main_screen.dart';
import 'package:bw_contact_tracing_app/services/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;
  bool firstPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else if (currentPage == 0) {
        firstPage = true;
      } else {
        lastPage = false;
        firstPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 30,
              child: PageView(
                children: <Widget>[
                  Container(
                    child: Walkthrough(
                      title: 'Bw Contact Tracing App explained',
                      content:
                          'What the Bw Contact Tracing app is App is and what info we collect and how it will be used',
                      imageIcon: Icons.mobile_screen_share,
                    ),
                  ),
                  Walkthrough(
                    title: 'Bluetooth',
                    content: 'What we use bluetooth For',
                    imageIcon: Icons.bluetooth,
                  ),
                  Walkthrough(
                    title: 'GPS and Location based services',
                    content: 'What we will do with location',
                    imageIcon: Icons.my_location,
                  ),
                  Walkthrough(
                    title: 'Getting Started',
                    content: 'How it will run',
                    imageIcon: Icons.directions_run,
                  ),
                ],
                controller: controller,
                onPageChanged: _onPageChanged,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(firstPage ? "" : "BACK",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => firstPage
                        ? null
                        : controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn),
                  ),
                  FlatButton(
                    child: Text(lastPage ? "GOT IT" : "NEXT",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage
                        ? Navigator.pushNamed(context, MainScreen.id)
                        : controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void nextScreen() async {
    await SharedPrefs().updateUsage();
    Navigator.pushNamed(context, MainScreen.id);
  }
}
