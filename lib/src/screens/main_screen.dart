import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:span/src/screens/inbox_screen.dart';
import 'package:span/src/screens/map_screen.dart';
import 'package:span/src/screens/money_screen.dart';
import 'package:span/src/screens/profile_screen.dart';
import 'package:span/src/screens/transaction_screen.dart';
import 'package:span/src/utils/size_config.dart';

class MainScreen extends StatefulHookWidget {
  MainScreen({Key key}) : super(key: key);

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: switchScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe905, fontFamily: 'span'),
              color: _selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            title: Text("Transfers"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe902, fontFamily: 'span'),
              color: _selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            title: Text("My Money"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe900, fontFamily: 'span'),
              color: _selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            title: Text("Map"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe901, fontFamily: 'span'),
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            title: Text("Inbox"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe903, fontFamily: 'span'),
              color: _selectedIndex == 4
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            title: Text("Me"),
          ),
        ],
      ),
    );
  }

  onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget switchScreen(int index) {
    Widget current = TransactionScreen();
    switch (index) {
      case 0:
        current = TransactionScreen();
        break;
      case 1:
        current = MoneyScreen();
        break;
      case 2:
        current = MapScreen();
        break;
      case 3:
        current = InboxScreen();
        break;
      case 4:
        current = ProfileScreen();
        break;
      default:
        current = TransactionScreen();
    }
    return current;
  }
}
