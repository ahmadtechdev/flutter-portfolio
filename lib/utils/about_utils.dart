class AboutUtils {
  // Date of birth: 12 August 2001
  static final DateTime dateOfBirth = DateTime(2001, 8, 12);

  static String get age {
    final now = DateTime.now();
    int years = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      years--;
    }
    return years.toString();
  }

  static const String aboutMeHeadline =
      'I\'m Ahmad Raza Ali, a passionate Flutter Developer and published researcher who loves turning ideas into real-world mobile applications.';

static const String aboutMeDetail =
    'As a Gold Medalist and Flutter specialist, I’ve launched 15+ live apps, ranging from ride-hailing platforms like Ridelo to complex travel booking systems. My work, including the IGNITE-funded "EnergicView" published at IEEE, is built on clean architecture and high performance. '
    'Currently, as a Rising Talent on Upwork, I bridge the gap between creative ideas and production-ready solutions for global clients. Whether it’s building IoT systems, integrating complex APIs, or leading enterprise-level projects at Journey Online—I am driven by clean code and delivering real-world impact. Let’s turn your vision into a scalable reality.';
}