import 'package:flutter/painting.dart' show BoxShadow, Color;

const duration = Duration(milliseconds: 200);
const size = 45.0;
const options = ['Recojer', 'Enviar', 'Valparaiso'];
final shadow = [BoxShadow(color: AppColors.blue.withOpacity(.1), blurRadius: 25)];

class AppColors {
  static final blue = Color(0xFF3F90F6);
  static final orange = Color(0xFFED8306);
  static final grey = Color(0xFF7A7A7A);
  static final greyDark = Color(0xFF404040);
  static final greyLight = Color(0xFFC4C4C4);
  static final blueLight = Color(0xFFF5F9FF);
}
