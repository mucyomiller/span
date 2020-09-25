import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/models/slider.dart';
import 'package:span/src/screens/sign_in.dart';
import 'package:span/src/widgets/slide_dots.dart';
import 'package:span/src/widgets/slide_item.dart';

class SliderPageView extends StatefulWidget {
  final SharedPreferences prefs;
  SliderPageView({this.prefs});
  @override
  State<StatefulWidget> createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<SliderPageView> {
  int _currentPage = 0;
  bool _lastpage = false;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      if (_currentPage == slidesList.length - 1) {
        _lastpage = true;
      } else {
        _lastpage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: slidesList.length,
                itemBuilder: (context, i) => SlideItem(i),
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: _lastpage
                        ? GestureDetector(
                            onTap: () {
                              // navigate to sign in &  up screen
                              widget.prefs.setBool("seen", true);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: 15.0, bottom: 15.0),
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: _lastpage
                        ? null
                        : GestureDetector(
                            onTap: () {
                              if (_currentPage != 2) {
                                _pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              }
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15.0, bottom: 15.0),
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < slidesList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
