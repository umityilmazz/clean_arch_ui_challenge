// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clean_architechture_temp/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

import 'package:clean_architechture_temp/core/extensions/common_extensions.dart';

class AnimatedUserWelcomeText extends StatelessWidget {
  const AnimatedUserWelcomeText({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: context.horizontalPaddingMedium,
      sliver: SliverToBoxAdapter(
          child: SizedBox(
        width: 200,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText('Hey $userName,',
                      speed: const Duration(milliseconds: 300),
                      textStyle: TextConstants.instance.userNameTextStyle,
                      curve: Curves.bounceIn),
                ],
              ),
              context.emptySizedHeightBoxLow,
              Row(
                children: [
                  AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText('Let\'s,',
                          speed: const Duration(milliseconds: 350),
                          textStyle: TextConstants.instance.lightBoldHeading,
                          curve: Curves.bounceIn),
                    ],
                  ),
                  AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(' continue',
                          speed: const Duration(milliseconds: 450),
                          textStyle: TextConstants.instance.boldDarkHeading,
                          curve: Curves.bounceIn),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
