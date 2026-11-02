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
      'I\'m Ahmad Raza Ali, a Full-Stack Engineer specializing in Flutter and Laravel, with 3+ years of shipping production apps.';

  static const String aboutMeDetail =
      'I build cross-platform Flutter apps and Laravel backends for travel-tech, ride-hailing, and business SaaS. I\'ve built booking platforms integrated with Sabre and airline APIs (Emirates, Fly Dubai, Air Blue), real-time ride-hailing apps like Ridelo, and payment workflows with JazzCash and AbhiPay, with 15+ apps live on the Play Store. '
      'I\'m a Gold Medalist in Computer Science from NUML and first author of an IEEE ICECE 2025 paper on EnergicView, an IGNITE-funded IoT energy monitoring system. Today I work as Operations & IT Officer at STFA Construction in Benghazi, automating business workflows with Power Apps and Power Automate, while delivering freelance projects for global clients. I\'m open to full-time engineering roles and relocation (UAE, KSA, Europe).';
}
