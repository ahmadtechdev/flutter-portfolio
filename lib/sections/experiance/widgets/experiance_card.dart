import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_theme.dart';
import '../../../configs/app_typography.dart';
import '../../../configs/space.dart';
import '../../../provider/app_provider.dart';

class ExperienceCard extends StatefulWidget {
  final String companyLogo;
  final String companyName;
  final String role;
  final String duration;
  final String description;

  const ExperienceCard({
    Key? key,
    required this.companyLogo,
    required this.companyName,
    required this.role,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        cardKey.currentState!.toggleCard();
      },
      onHover: (hovering) {
        setState(() {
          isHover = hovering;
        });
      },
      child: FlipCard(
        key: cardKey,
        flipOnTouch: kIsWeb ? false : true,
        front: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? AppTheme.c!.primary!.withAlpha(100)
                    : Colors.black.withAlpha(50),
                blurRadius: 12.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.companyLogo,
                height: AppDimensions.normalize(30),
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.business,
                  size: AppDimensions.normalize(30),
                  color: AppTheme.c!.primary,
                ),
              ),
              Space.y!,
              Text(
                widget.companyName,
                style: AppText.b2b!.copyWith(
                  color: appProvider.isDark ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Space.y1!,
              Text(
                widget.role,
                style: AppText.b2!.copyWith(
                  color: appProvider.isDark ? Colors.white54 : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              Space.y1!,
              Text(
                widget.duration,
                style: AppText.l1!.copyWith(
                  color: appProvider.isDark ? Colors.white38 : Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        back: Container(
          width: AppDimensions.normalize(100),
          height: AppDimensions.normalize(80),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? AppTheme.c!.primary!.withAlpha(100)
                    : Colors.black.withAlpha(50),
                blurRadius: 12.0,
                offset: const Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.description,
                style: AppText.l1!.copyWith(
                  color: appProvider.isDark ? Colors.white54 : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}