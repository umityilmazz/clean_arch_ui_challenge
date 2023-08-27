import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'book_home_page.dart';
import 'reading_book_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CarouselSliderController _carouselSliderController;

  @override
  void initState() {
    super.initState();
    _carouselSliderController = CarouselSliderController();
  }

  @override
  void dispose() {
    _carouselSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CarouselSlider(
          keepPage: true,
          onSlideStart: () {
            print("ON SLIDE START");
          },
          onSlideChanged: (value) {
            if (value == 0) {
              print("SLIDE 0 PAGE");
            }
            if (value == 1) {
              print("SLIDE PAGE 1");
            }
          },
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autoSliderTransitionTime: const Duration(seconds: 1),
          autoSliderDelay: const Duration(seconds: 2),
          controller: _carouselSliderController,
          slideTransform: const CubeTransform(),
          children: [
            BookHomePage(carouselSliderController: _carouselSliderController),
            ReadingBookListPage(
                carouselSliderController: _carouselSliderController),
          ]),
    );
  }
}
