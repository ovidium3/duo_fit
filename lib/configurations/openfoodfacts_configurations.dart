import 'package:openfoodfacts/openfoodfacts.dart';

class OpenfoodfactsConfigurations {
  static void init() {
    OpenFoodAPIConfiguration.userAgent =
        const UserAgent(name: 'DuoFit', url: 'Your url, if applicable');

    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ENGLISH
    ];

    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.USA;
  }
}
