// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:clean_architechture_temp/core/extensions/common_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// this widget take  mainWidget and listening blurNotifier in this way 
// we can change all screen blur dynamcly

class BluredContainer extends StatelessWidget {
  final Widget mainWidget;
  const BluredContainer({
    Key? key,
    required this.mainWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final blurNotifier=context.watch<BlurNotifier>();
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          mainWidget,
          Positioned.fill(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurNotifier.getBlurValue,
                  sigmaY: blurNotifier.getBlurValue,
                ),
                child: const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlurNotifier extends ChangeNotifier {
  double _blurValue = 0;
  double get getBlurValue => _blurValue;

  set setBlurValue(double value) {
    _blurValue = value;
    notifyListeners();
  }
}
