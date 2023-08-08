// Contains text constants for dialog messages
class DialogTexts {
  // Common
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';

  // Basic validation errors
  static const String enterUsername = 'Please enter your username';
  static const String enterValidUsername =
      'Username must be at least 2 characters';
  static const String enterEmail = 'Please enter your email';
  static const String enterValidEmail = 'Please enter a valid email';
  static const String enterPassword = 'Please enter your password';
  static const String enterValidPassword =
      'Password must be at least 6 characters long';

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

  // Email verification
  static const String sent = 'Sent';
  static const String verifyEmail = 'Please verify your email first';

  // Forgot password
  static const String passwordResetEmailSent =
      'We have sent you an email to reset your password';

  // Calorie log
  static const String editFoods = 'Edit Foods';

  static const String addFood = 'Add Food';
  static const String addCustomFood = 'Add Custom Food';
  static const String foodName = 'Food Name';
  static const String calories = 'Calories';

  static const String removeFood = 'Remove Food';
  static const String removeCustomFood = 'Remove Custom Food';
  static const String confirmRemoveFood =
      'Are you sure you want to permanently remove this food item?';

  static const String success = 'Success!';
  static const String foodAdded = 'has been added to your foods';
  static const String foodRemoved = 'has been removed from your foods';
  static const String unableToAddFood = 'Unable to add food';

  // Workout
  static const String finish = 'Finish';
  static const String finishedWorkout = 'Are you ready to finish your workout?';
  static const String cancelWorkout = 'Cancel Workout';
  static const String cancelWorkoutText =
      'Are you sure you want to cancel your workout? All progress will be lost';

  static const String plusTen = '+10s';
  static const String minusTen = '-10s';
  static const String skip = 'Skip';

  // Edit profile
  static const String usernameUpdated = 'Username updated successfully!';

  static const String unableToGetCameraImage =
      'Unable to get image from camera';
  static const String unableToGetDeviceImage =
      'Unable to get image from device';
  static const String unableToUpdateImage = 'Unable to update image path';
  static const String profilePictureUpdated =
      'Profile picture updated successfully!';

  static const String emailUpdated = 'Email updated successfully!';

  static const String passwordUpdated = 'Password updated successfully!';

  static const String confirmDeleteAccount =
      'Are you sure you want to delete your account?';
  static const String accountDeleted = 'Account deleted successfully';
}
