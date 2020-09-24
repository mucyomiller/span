import 'package:flutter/foundation.dart';

class Slider {
  final String imageUrl;
  final String title;
  final String subTitle;

  Slider(
      {@required this.imageUrl, @required this.title, @required this.subTitle});
}

final slidesList = [
  Slider(
      imageUrl: 'assets/images/slide-1.png',
      title: "One",
      subTitle: "One Sub"),
  Slider(
      imageUrl: 'assets/images/slide-2.png',
      title: "Two",
      subTitle: "Two Sub"),
  Slider(
      imageUrl: 'assets/images/slide-3.png',
      title: "Three",
      subTitle: "Three Sub"),
];