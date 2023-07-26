import 'package:openfoodfacts/openfoodfacts.dart';

class OpenfoodfactsConfigurations {
  // Initialize Openfoodfacts information
  static void init() {
    OpenFoodAPIConfiguration.userAgent =
        const UserAgent(name: 'DuoFit', url: 'Your url, if applicable');
    // Language set to english
    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ENGLISH
    ];
    // Default country USA, change later to be custom to user
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.USA;
  }
}
