import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:span/src/widgets/wavy_header.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var _dsize = MediaQuery.of(context).size.shortestSide;
    var items = List<Widget>.generate(
        5,
        (int index) => Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/11447549?s=460&v=4'),
                        backgroundColor: Colors.transparent),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Text view'),
                        Text('@niyobobo • 49s'),
                      ],
                    )
                  ],
                ),
                Text(
                    'Name Surname Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.red,
                          value: 0.2,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          IconData(0xe90a, fontFamily: 'hahiye'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '90',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(IconData(0xe90b, fontFamily: 'hahiye')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '78',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ));
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: <Widget>[
                  WavyHeader(),
                  Positioned(
                    width: 120,
                    height: 120,
                    right: _dsize / 3,
                    bottom: 0,
                    child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars3.githubusercontent.com/u/11447549?s=400&v=4'),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(7.0), // border width
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF), // border color
                          shape: BoxShape.circle,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'FRED MUCYO',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                IconData(0xe904, fontFamily: 'span'),
                                color: Theme.of(context).primaryColor,
                              )
                            ]),
                        Text(
                          '@mucyofred',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Color(0xFF404040),
                              ),
                              Text('Kimironko')
                            ])
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        "Hi! I'm fred. Contact me at me@mucyofred.com",
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '140',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Transactions',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '140',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'sents',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '140',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'received',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
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
