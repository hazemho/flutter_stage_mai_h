import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,

  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/slider1.png',
    title: 'Envoyer ce que vous voulez partout dans le monde',

  ),
  Slide(
    imageUrl: 'assets/images/slider2.png',
    title: 'Rendez service à quelqu\'un et gagner de l\'argent,'

  ),
  Slide(
    imageUrl: 'assets/images/slider3.png',
    title: 'Transmettez vos collis en toute sécurité',
  ),
];