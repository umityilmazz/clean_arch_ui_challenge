// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/extensions/common_extensions.dart';
import 'profile_image_card.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.carouselSliderController,
  }) : super(key: key);
  final CarouselSliderController carouselSliderController;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: context.horizontalPaddingMedium,
      sliver: SliverAppBar(
        elevation: 0,
        backgroundColor: AppColors.scafoldBackground,
        toolbarHeight: context.highValue * 1.4,
        leading: const ProfileImageCard(),
        actions: [
          _buildReadingListIcon(context, carouselSliderController),
        ],
      ),
    );
  }
}

_buildReadingListIcon(
    BuildContext context, CarouselSliderController carouselSliderController) {
  return InkWell(
    onTap: () {
      carouselSliderController.nextPage();
    },
    child: Image.asset(
      AssetConstants.instance.book,
      alignment: Alignment.center,
      width: context.mediumValue * 1.2,
    ),
  );
}
