import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wisatabandung/DetailMobilePage.dart';
import 'package:wisatabandung/DetailWebPage.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  // const DetailScreen({Key? key}) : super(key: key);
  final TourismPlace place;
  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobileScreen(place: place);
        }
      },
    );
  }
}
