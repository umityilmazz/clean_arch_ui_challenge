import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/extensions/common_extensions.dart';
import '../../../../injection_container.dart';
import '../blocs/article/remote/bloc/remote_book_bloc.dart';
import '../widgets/animated_user_welcome_text.dart';
import '../widgets/book_list_cards.dart';
import '../widgets/curently_reading_section.dart';
import '../widgets/header_section.dart';
import '../widgets/horizontal_book_section.dart';

class BookHomePage extends StatelessWidget {
  const BookHomePage({
    Key? key,
    required this.carouselSliderController,
  }) : super(key: key);
  final CarouselSliderController carouselSliderController;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scafoldBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.scafoldBackground,
          body: CustomScrollView(
            slivers: [
              HeaderSection(
                  carouselSliderController: carouselSliderController),
              SliverPadding(padding: context.onlyTopPaddingLow),
              const AnimatedUserWelcomeText(userName: "Umit"),
              const CurentlyReadingSection(),
              const HorizonralBookSection(),
              const BookListCard()
            ],
          ),
        ),
      ),
    );
  }
}
