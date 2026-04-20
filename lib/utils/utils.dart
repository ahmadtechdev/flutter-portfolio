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
  static const String upwork = 'assets/work/upwork.png';

  // services
  static const String webDev = 'assets/services/web.png';
  static const String java = 'assets/services/java.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String python = 'assets/services/python.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

static const List<String> socialIconURL = [
  "https://img.icons8.com/material-rounded/96/ffffff/facebook-new.png",
  "https://img.icons8.com/material-rounded/96/ffffff/instagram-new.png",
  "https://img.icons8.com/material-rounded/96/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/96/ffffff/github.png",
  "https://img.icons8.com/ios-filled/96/ffffff/upwork.png",
  "https://img.icons8.com/?size=100&id=PZknXs9seWCp&format=png&color=000000" // Ye original logo hai
];

  static const List<String> socialLinks = [
    "https://www.facebook.com/ahmadtechdev/",
    "https://www.instagram.com/ahmadtechdev/",
    
    "https://linkedin.com/in/ahmad-razaa",
    "https://github.com/ahmadtechdev",
    "https://upwork.com/freelancers/~01c55012053a4ec3b9",
    "https://leetcode.com/u/ahmadrazaa/"
  ];

  static const String resume =
      'https://drive.google.com/file/d/1MfY1DF-M14Crgiq_mWO1QnT240XFBULP/view?usp=sharing';

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
