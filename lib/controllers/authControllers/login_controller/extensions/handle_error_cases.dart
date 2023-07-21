import 'package:duo_fit/controllers/authControllers/login_controller/login_controller.dart';

import '../../../../constants/text_constants.dart';
import '../../../../helpers/string_methods.dart';

extension ErrorHandlesExtension on LoginController {
  void handleErrorCases(e) {
    // Errors checks (if you want to be more specific make for each error a case) on this pattern
    if (e.code == 'network-request-failed') {
      dialogsAndLoadingController
          .showError(capitalize(TextConstants.checkConnection));
    }
    if (e.code == 'user-not-found') {
      dialogsAndLoadingController.showError(TextConstants.noUserText);
    } else if (e.code == 'wrong-password') {
      dialogsAndLoadingController
          .showError(capitalize(TextConstants.wrongPassword));
    } else {
      dialogsAndLoadingController.showError(e.code);
    }
  }
}
