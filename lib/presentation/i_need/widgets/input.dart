import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.placeHolder,
    @required this.maxLines,
    @required this.controller,
  }) : super(key: key);

  final String placeHolder;
  final int maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(color: AppColors.blue.withOpacity(.08), borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      placeholder: placeHolder,
      placeholderStyle: GoogleFonts.roboto(color: AppColors.grey, fontWeight: FontWeight.w300),
      style: GoogleFonts.roboto(color: AppColors.greyDark, fontWeight: FontWeight.w300),
      maxLines: maxLines,
      controller: controller,
    );
  }
}
