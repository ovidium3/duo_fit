import 'package:firebase_auth/firebase_auth.dart';
import 'package:duo_fit/controllers/auth_controllers/sign_up_controller/sign_up_controller.dart';

import '../../../../../constants/text_constants/general_text_constants.dart';
import '../../../../../helpers/string_methods.dart';

extension ErrorCasesHandler on SignUpController {
  void _handleErrorCases(FirebaseAuthException e) {
    print(e);
    if (e.code == 'network-request-failed') {
      dialogsAndLoadingController.showError(
        capitalize(
          TextConstants.checkConnection,
        ),
      );
    } else if (e.code == 'weak-password') {
      dialogsAndLoadingController.showError(
        capitalize(
          TextConstants.weakPassword,
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      dialogsAndLoadingController.showError(
        capitalize(
          TextConstants.emailAlreadyInUse,
        ),
      );
    }
  }

  /// Shows error dialog for handled exception, set showErrorDialogOnUnhandledError to false to show nothing for unhandled firebase error
  void Function(FirebaseAuthException) get handleErrorCases =>
      _handleErrorCases;
}
