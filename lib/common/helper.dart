class Helper {
  static bool validateName(String name, int maxLength) {
    if ( name.isEmpty) {
      return false;
    }
    if (name.length > maxLength) {
      return false;
    }
    return true;
  }

  static bool validatePrice(int value, int minValue, int maxValue) {


    if (value < minValue) {
      return false; // Không hợp lệ
    }

    if (value > maxValue) {
      return false; // Không hợp lệ
    }
    return true; // Hợp lệ
  }
}
