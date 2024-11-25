import 'package:intl/intl.dart';

class Helperfunctions {
  static bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
