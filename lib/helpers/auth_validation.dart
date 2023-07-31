// A String extension that returns a boolean value to represent validity
extension AuthValidation on String {
  // Returns true if the String is a valid email address, false otherwise
  bool get isValidEmail {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

  // Returns true if the password is at least 6 characters long, false otherwise
  bool get isValidPassword => length >= 6;

  // Returns true if the username is at least 2 characters long, false otherwise
  bool get isValidUsername => length >= 2;
}
