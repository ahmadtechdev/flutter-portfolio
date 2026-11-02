import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/social_links.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      height: size.height,
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  StaticUtils.blackWhitePhoto,
                  height: size.width < 1200
                      ? size.height * 0.75
                      : size.height * 0.85,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: AppDimensions.normalize(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WELCOME TO MY PORTFOLIO! ',
                      style: AppText.b1!.copyWith(
                          fontFamily: 'Montserrat',
                          color: appProvider.isDark ? Colors.white : Colors.black),
                    ),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        StaticUtils.hi,
                        height: AppDimensions.normalize(12),
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  "Ahmad",
                  style: AppText.h1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(25),
                    fontWeight: FontWeight.w100,
                      color: appProvider.isDark ? Colors.white : Colors.black
                  ),
                ),
                Text(
                  "Raza",
                  style: AppText.h1b!.copyWith(
                    fontSize: AppDimensions.normalize(25),
                    height: 1,
                      color: appProvider.isDark ? Colors.white : Colors.black
                  ),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppTheme.c!.primary!,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            ' Full-Stack Engineer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1!.copyWith(
                                color: appProvider.isDark ? Colors.white : Colors.black
                            ),
                          ),
                          TyperAnimatedText(
                            ' Flutter & Laravel Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1!.copyWith(
                                color: appProvider.isDark ? Colors.white : Colors.black
                            ),
                          ),
                          TyperAnimatedText(
                            ' IEEE Published Author',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1!.copyWith(
                                color: appProvider.isDark ? Colors.white : Colors.black
                            ),
                          ),
                          TyperAnimatedText(
                            ' Gold Medalist in CS',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1!.copyWith(
                                color: appProvider.isDark ? Colors.white : Colors.black
                            ),
                          ),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
