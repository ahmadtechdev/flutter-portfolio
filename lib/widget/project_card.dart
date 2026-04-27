import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/app_provider.dart';

import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;
  final bool isFeatured;

  const ProjectCard({
    Key? key,
    this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    this.isFeatured = false,
    required this.projectTitle,
    required this.projectDescription,
  }) : super(key: key);

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.projectLink == null
          ? () {}
          : () => openURL(
                widget.projectLink!,
              ),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        margin: Space.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: widget.isFeatured
              ? LinearGradient(
                  colors: [
                    AppTheme.c!.primary!.withAlpha(120),
                    AppTheme.c!.primary!.withAlpha(50),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: widget.isFeatured
              ? [
                  BoxShadow(
                    color: AppTheme.c!.primary!.withAlpha(80),
                    blurRadius: 18,
                    spreadRadius: 0.2,
                    offset: const Offset(0, 6),
                  )
                ]
              : null,
        ),
        child: Container(
          padding: widget.isFeatured ? const EdgeInsets.all(1.2) : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: widget.isFeatured
                ? LinearGradient(
                    colors: [
                      Colors.white.withAlpha(appProvider.isDark ? 18 : 100),
                      AppTheme.c!.primary!.withAlpha(40),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Container(
            padding: Space.all(),
            width: AppDimensions.normalize(150),
            height: AppDimensions.normalize(90),
            decoration: BoxDecoration(
              color: appProvider.isDark ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isHover
                  ? [
                      BoxShadow(
                        color: AppTheme.c!.primary!.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 12.0,
                        offset: const Offset(0.0, 0.0),
                      )
                    ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.projectIcon != null
                          ? (width > 1135 || width < 950)
                              ? Image.asset(
                                  widget.projectIcon!,
                                  height: height * 0.05,
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      widget.projectIcon!,
                                      height: height * 0.03,
                                    ),
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Text(
                                      widget.projectTitle,
                                      style: AppText.b2b!.copyWith(
                                          color: appProvider.isDark
                                              ? Colors.white
                                              : Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                          : Container(),
                      widget.projectIconData != null
                          ? Icon(
                              widget.projectIconData,
                              color: AppTheme.c!.primary!,
                              size: height * 0.1,
                            )
                          : Container(),
                      (width > 1135 || width < 950)
                          ? SizedBox(
                              height: height * 0.02,
                            )
                          : const SizedBox(),
                      (width > 1135 || width < 950)
                          ? Text(
                              widget.projectTitle,
                              style: AppText.b2b!.copyWith(
                                  color: appProvider.isDark
                                      ? Colors.white
                                      : Colors.black),
                              textAlign: TextAlign.center,
                            )
                          : Container(),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        widget.projectDescription,
                        style: TextStyle(
                            color:
                                appProvider.isDark ? Colors.white : Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: isHover ? 0.0 : 1.0,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: widget.banner != null
                        ? _BannerPreview(
                            bannerPath: widget.banner!,
                            isFeatured: widget.isFeatured,
                            isDarkTheme: appProvider.isDark,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerPreview extends StatelessWidget {
  final String bannerPath;
  final bool isFeatured;
  final bool isDarkTheme;

  const _BannerPreview({
    required this.bannerPath,
    required this.isFeatured,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      bannerPath,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        if (!isFeatured) {
          return _bannerSkeleton(baseDark: isDarkTheme);
        }
        return _ShimmerSkeleton(baseDark: isDarkTheme);
      },
      errorBuilder: (context, error, stackTrace) {
        return _bannerSkeleton(baseDark: isDarkTheme);
      },
    );
  }

  Widget _bannerSkeleton({required bool baseDark}) {
    return Container(
      color: baseDark ? Colors.grey[850] : Colors.grey[300],
    );
  }
}

class _ShimmerSkeleton extends StatefulWidget {
  final bool baseDark;

  const _ShimmerSkeleton({required this.baseDark});

  @override
  State<_ShimmerSkeleton> createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<_ShimmerSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.baseDark ? const Color(0xFF2C2C2C) : const Color(0xFFE5E5E5);
    final highlightColor =
        widget.baseDark ? const Color(0xFF424242) : const Color(0xFFF5F5F5);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0 + (2.5 * t), -0.2),
              end: Alignment(0.0 + (2.5 * t), 0.2),
              colors: [baseColor, highlightColor, baseColor],
              stops: const [0.15, 0.5, 0.85],
            ),
          ),
        );
      },
    );
  }
}
