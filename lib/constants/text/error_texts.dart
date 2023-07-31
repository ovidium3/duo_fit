class ErrorTexts {
  // Firebase auth errors
  static const String requiresRecentLogin =
      'Please log in again before trying this request again';
  static const String invalidEmail = 'User email not valid, please try again';
  static const String userDisabled =
      'User is currently disabled, contact support for more information';
  static const String userNotFound = 'No user with this email exists';
  static const String emailInUse = 'Email is already in use';
  static const String wrongPassword = 'Wrong password, please try again';
  static const String weakPassword = 'Please use a stronger password';
  static const String tooManyRequests =
      'Too many requests, please try again later';

  // Basic validation errors
  static const String enterUsername = 'Please enter your username';
  static const String enterValidUsername =
      'Username must be at least 2 characters';
  static const String enterEmail = 'Please enter your email';
  static const String enterValidEmail = 'Please enter a valid email';
  static const String enterPassword = 'Please enter your password';
  static const String enterValidPassword =
      'Password must be at least 6 characters long';

  // Image errors
  static const String unableToGetCameraImage =
      'Unable to get image from camera';
  static const String unableToGetDeviceImage =
      'Unable to get image from device';
  static const String unableToUpdateImage = 'Unable to update image path';
  // Email verification errors
  static const String sent = 'Sent';
  static const String verifyEmail = 'Please verify your email first';

  // static const String emailVerifSentText =
  //     'we\'ve sent you an email to reset your password, check your inbox';
  // static const String checkConnection = 'check your internet connection';
  // static const String fillFields = 'please, fill all fields';
}
