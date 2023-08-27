// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../config/theme/colors/app_colors.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/extensions/common_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ReadingBookListPage extends StatelessWidget {
  const ReadingBookListPage({
    Key? key,
    required this.carouselSliderController,
  }) : super(key: key);
  final CarouselSliderController carouselSliderController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return SafeArea(
      top: false,
      child: Container(
        height: context.height,
        color: AppColors.scafoldBackground,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: context.mediumValue * 1.5,
                height: context.height,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: context.mediumValue,
              left: context.normalValue,
              right: context.normalValue,
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _backButton(context, carouselSliderController),
                            context.emptySizedWidthBoxLow,
                            _shelfText(context),
                            context.emptySizedWidthBoxLow,
                          ],
                        ),
                        _searchButton(context)
                      ],
                    ),
                    context.emptySizedHeightBoxNormal,
                    context.emptySizedHeightBoxNormal,
                    Padding(
                      padding: context.onlyLeftPaddingMedium * 1.7,
                      child: Text(
                        "Reading List",
                        style: TextConstants.instance.boldDarkHeading,
                      ),
                    ),
                    context.emptySizedHeightBoxNormal,
                    context.emptySizedHeightBoxNormal,
                    Expanded(
                      child: Padding(
                        padding: context.onlyLeftPaddingMedium * 1.7,
                        child: GridView.count(
                          padding: context.onlyRightPaddingMedium,
                          mainAxisSpacing: context.mediumValue,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: context.normalValue * 2,
                          crossAxisCount: 2,
                          children: List.generate(
                            100,
                            (int index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: context.lowBorderRadius,
                                          border:
                                              Border.all(color: Colors.black),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(5, 7))
                                          ]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bookItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: context.highValue * 2.7,
          decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: context.mediumBorderRadius,
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(7, 7))
              ]),
        ),
      ],
    );
  }

  Container _searchButton(BuildContext context) {
    return Container(
      height: context.mediumValue * 1.7,
      width: context.highValue * 1.7,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 5))],
        borderRadius: context.highBorderRadius,
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.red,
      ),
    );
  }

  Padding _shelfText(BuildContext context) {
    return Padding(
      padding:
          context.onlyLeftPaddingNormal.copyWith(top: context.lowValue * 2),
      child: Text(
        "SHELF",
        style: TextConstants.instance.boldDarkHeading,
      ),
    );
  }

  Widget _backButton(
      BuildContext context, CarouselSliderController carouselSliderController) {
    return InkWell(
      onTap: () {
        carouselSliderController.previousPage();
      },
      child: Container(
        height: context.mediumValue * 2,
        width: context.mediumValue * 2,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(color: Colors.black, offset: Offset(5, 6))
            ],
            border: Border.all(color: Colors.black, width: 2)),
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}
