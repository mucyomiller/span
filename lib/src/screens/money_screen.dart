import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MoneyScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Money'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accounts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset('assets/images/default_avatar.png'),
                title: Text('Spending'),
                trailing: Text('FRW 0.00'),
              ),
            ),
            ListTile(
              leading: Text(
                'Total',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Text('FRW 0.00'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton.icon(
                    elevation: 5,
                    onPressed: () {},
                    icon: Icon(
                      IconData(0xe902, fontFamily: 'span'),
                      color: Colors.white,
                    ),
                    label: Text(
                      'Top Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  RaisedButton.icon(
                    elevation: 5,
                    onPressed: () {},
                    icon: Icon(
                      IconData(0xe902, fontFamily: 'span'),
                    ),
                    label: Text('Cash out'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
