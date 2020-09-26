import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String username;
  final String time;
  final String content;

  const TransactionCard({Key key, this.username, this.time, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  size: 11.5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
