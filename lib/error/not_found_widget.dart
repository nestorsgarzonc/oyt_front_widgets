import 'package:flutter/material.dart';
import 'package:oyt_front_core/constants/lotti_assets.dart';
import 'package:lottie/lottie.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(LottieAssets.notFound, height: 200),
        const SizedBox(width: double.infinity, height: 10),
        Text(title),
      ],
    );
  }
}
