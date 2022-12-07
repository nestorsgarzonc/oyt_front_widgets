import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oyt_front_core/constants/lotti_assets.dart';
import 'package:oyt_front_widgets/widgets/divider.dart';

class OnboardingAnimationTitle extends StatelessWidget {
  const OnboardingAnimationTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Lottie.asset(
          LottieAssets.food,
          width: size.width,
          height: size.height * 0.44,
        ),
        const CustomDivider(),
        AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText(
              'On Your Table',
              speed: const Duration(milliseconds: 100),
              textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
