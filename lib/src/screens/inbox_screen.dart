import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:span/src/models/notification_item.dart';

class InboxScreen extends StatefulHookWidget {
  static const routeName = 'inbox';

  _InboxScreenState createState() => new _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  List<NotificationItem> _notifications = [
    NotificationItem.fromJson({
      'title': 'How to valiate: Harabura  gato ngo...',
      'content': 'Lorem ipusm',
      'time': '20:00 09-26-2020'
    }),
    NotificationItem.fromJson({
      'title': 'How to valiate: Harabura  gato ngo...',
      'content': 'Lorem ipusm',
      'time': '20:00 09-26-2020'
    }),
    NotificationItem.fromJson({
      'title': 'How to valiate: Harabura  gato ngo...',
      'content': 'Lorem ipusm',
      'time': '20:00 09-26-2020'
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          'Inbox',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Text('${_notifications.length} messages'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (BuildContext context, int i) {
                NotificationItem _notification = _notifications[i];
                return InkResponse(
                  onTap: () {},
                  highlightShape: BoxShape.rectangle,
                  radius: 0.0,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.envelope),
                    title: Text(
                      '${_notification.title}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text: '${_notification.time}',
                        style: TextStyle(
                          color: Color(0XFFB40707),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
