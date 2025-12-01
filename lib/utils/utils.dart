import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/experiance/experiance.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/services/services.dart';
import 'package:folio/widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile1.png';
  static const String coloredPhoto = 'assets/photos/colored1.jpeg';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String university = 'assets/work/numl.png';
  static const String journeyOnline = 'assets/work/jo logo.png';
  static const String ridelo = 'assets/work/ridelo.png';

  // services
  static const String webDev = 'assets/services/web.png';
  static const String java = 'assets/services/java.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String python = 'assets/services/python.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/100/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/200/ffffff/instagram-new.png",
    "https://img.icons8.com/?size=200&id=VlBwFtdwgxko&format=png&color=ffffff",
    "https://img.icons8.com/metro/100/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/200/ffffff/github.png",
    "https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/200/external-level-up-your-coding-skills-and-quickly-land-a-job-logo-shadow-tal-revivo.png"
  ];

  static const List<String> socialLinks = [
    "https://www.facebook.com/ahmadtechdev/",
    "https://www.instagram.com/ahmadtechdev/",
    "https://x.com/Ahmad7253781",
    "https://linkedin.com/in/ahmad-razaa",
    "https://github.com/ahmadtechdev",
    "https://leetcode.com/u/ahmadrazaa/"
  ];

  static const String resume =
      'https://drive.google.com/file/d/1Je89KhkjcJmYQFJEFUpZjiFXfznvHnKI/view?usp=sharing';

  static const String gitHub = 'https://github.com/ahmadtechdev';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Experience(),
    Contact(),
    Footer(),
  ];
}
