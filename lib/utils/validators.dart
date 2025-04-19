class Validators {
  // Validate if a field is empty
  static String? validateEmptyField(String value, String fieldName) {
    if (value.isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  // Validate Email
  static String? validateEmail(String value) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Phone Number (Assumes international format, starting with + or digits)
  static String? validatePhoneNumber(String value) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    if (value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Validate Password (At least one uppercase, one lowercase, one number, and 8 characters)
  static String? validatePassword(String value) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$',
    );
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\nwith uppercase, lowercase, and a number';
    }
    return null;
  }

  // Validate OTP (4 digit)
  static String? validateOtp(String value) {
    if (value.isEmpty) {
      return 'OTP cannot be empty';
    } else if (value.length != 5) {
      return 'OTP must be 5 digits';
    }
    return null;
  }

  // Compare two passwords
  static String? validatePasswordCompare(
    String password,
    String confirmPassword,
  ) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return 'Password and confirmation cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Validate Name (Only alphabets and spaces)
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  // Validate Date of Birth (dd-mm-yyyy format)
  static String? validateDob(String value) {
    // Check if the input is 8 digits (DDMMYYYY)
    final RegExp dobRegex = RegExp(r'^\d{8}$');
    if (value.isEmpty) {
      return 'Date of birth cannot be empty';
    } else if (!dobRegex.hasMatch(value)) {
      return 'Please enter a valid date in DDMMYYYY format';
    }

    try {
      // Extract day, month, year from string
      final day = int.parse(value.substring(0, 2));
      final month = int.parse(value.substring(2, 4));
      final year = int.parse(value.substring(4, 8));

      // Check if month is valid
      if (month < 1 || month > 12) {
        return 'Please enter a valid month (01-12)';
      }

      // Check if day is valid
      if (day < 1 || day > 31) {
        return 'Please enter a valid day (01-31)';
      }

      // Month-specific day checks
      if (month == 2) {
        bool isLeapYear =
            (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > (isLeapYear ? 29 : 28)) {
          return 'February has only ${isLeapYear ? 29 : 28} days in $year';
        }
      } else if ([4, 6, 9, 11].contains(month)) {
        if (day > 30) {
          return '$month has only 30 days';
        }
      }

      final currentDate = DateTime.now();
      final dateOfBirth = DateTime(year, month, day);
      if (dateOfBirth.isAfter(currentDate)) {
        return 'Date of birth cannot be in the future';
      }
    } catch (e) {
      return 'Invalid date';
    }

    return null;
  }

  // Validate Pincode (6 digits)
  static String? validatePincode(String value) {
    final RegExp pincodeRegex = RegExp(r'^\d{6}$');
    if (value.isEmpty) {
      return 'Pincode cannot be empty';
    } else if (!pincodeRegex.hasMatch(value)) {
      return 'Pincode must be exactly 6 digits';
    }
    return null;
  }
}
