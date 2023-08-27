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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CarouselSlider(
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
