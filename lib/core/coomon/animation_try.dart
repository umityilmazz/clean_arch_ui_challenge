// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuickRotateBox extends StatefulWidget {
  final Widget rotationChild;
  const QuickRotateBox({
    Key? key,
    required this.rotationChild,
  }) : super(key: key);

  @override
  _QuickRotateBoxState createState() => _QuickRotateBoxState();
}

class _QuickRotateBoxState extends State<QuickRotateBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Animasyon süresi
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle:  _rotationAnimation.value * (2 * 3.14159) +-15 * 0.0175, // 0-1 aralığını 0-360 dereceye çevir
          child: widget.rotationChild,
        );
      },
    );
  }
}
