import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';
import 'package:folio/widget/staggered_reveal.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({Key? key}) : super(key: key);

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  bool _showAllProjects = false;

  List<ProjectData> get _visibleProjects =>
      _showAllProjects ? ProjectUtils.allProjects : ProjectUtils.featuredProjects;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          CustomSectionHeading(
            text: _showAllProjects ? "\nPortfolio" : "\nFeatured Projects",
          ),
          const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n",
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              final slideTween = Tween<Offset>(
                begin: const Offset(0, 0.03),
                end: Offset.zero,
              );
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: slideTween.animate(animation),
                  child: child,
                ),
              );
            },
            child: Wrap(
              key: ValueKey<bool>(_showAllProjects),
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: AppDimensions.normalize(10),
              children: _visibleProjects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                return StaggeredReveal(
                  delay: Duration(milliseconds: 60 * index),
                  child: ProjectCard(
                    banner: project.banner,
                    projectIcon: project.icon,
                    projectLink: project.link,
                    projectTitle: project.title,
                    projectDescription: project.description,
                    isFeatured: !_showAllProjects,
                  ),
                );
              }).toList(),
            ),
          ),
          Space.y2!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.normalize(14),
                width: AppDimensions.normalize(58),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _showAllProjects = !_showAllProjects;
                    });
                  },
                  child: Text(
                    _showAllProjects ? 'Show Featured' : 'Show All Projects',
                    style: AppText.l1b,
                  ),
                ),
              ),
              Space.x1!,
              SizedBox(
                height: AppDimensions.normalize(14),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  onPressed: () => openURL(StaticUtils.gitHub),
                  child: Text(
                    'GitHub',
                    style: AppText.l1b,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
