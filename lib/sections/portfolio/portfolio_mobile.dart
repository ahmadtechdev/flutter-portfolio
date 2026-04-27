import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';
import 'package:folio/widget/staggered_reveal.dart';

class PortfolioMobileTab extends StatefulWidget {
  const PortfolioMobileTab({Key? key}) : super(key: key);

  @override
  State<PortfolioMobileTab> createState() => _PortfolioMobileTabState();
}

class _PortfolioMobileTabState extends State<PortfolioMobileTab> {
  bool _showAllProjects = false;

  List<ProjectData> get _visibleProjects =>
      _showAllProjects ? ProjectUtils.allProjects : ProjectUtils.featuredProjects;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomSectionHeading(
          text: _showAllProjects ? "\nPortfolio" : "\nFeatured Projects",
        ),
        CustomSectionSubHeading(
          text: _showAllProjects
              ? "Swipe through all projects.\n\n"
              : "Quick featured showcase for better speed.\n\n",
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: CarouselSlider.builder(
            key: ValueKey<bool>(_showAllProjects),
            itemCount: _visibleProjects.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageIndex) {
              final project = _visibleProjects[itemIndex];
              return StaggeredReveal(
                delay: Duration(milliseconds: 70 * itemIndex),
                beginOffset: const Offset(0, 0.04),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ProjectCard(
                    banner: project.banner,
                    projectIcon: project.icon,
                    projectLink: project.link,
                    projectTitle: project.title,
                    projectDescription: project.description,
                    isFeatured: !_showAllProjects,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: height * 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
        ),
        Space.y!,
        Wrap(
          spacing: AppDimensions.normalize(6),
          runSpacing: AppDimensions.normalize(4),
          alignment: WrapAlignment.center,
          children: [
            SizedBox(
              height: AppDimensions.normalize(14),
              width: AppDimensions.normalize(62),
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
    );
  }
}
