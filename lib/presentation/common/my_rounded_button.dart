import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton({
    Key key,
    @required this.text,
    this.backgroundColor,
    this.textColor,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      pressedOpacity: .85,
      child: Container(
        decoration: BoxDecoration(
            color: (onPressed == null) ? AppColors.grey : this.backgroundColor ?? AppColors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyDark.withOpacity(.05),
                blurRadius: 7,
                spreadRadius: 2,
              ),
            ]),
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          this.text,
          style: GoogleFonts.roboto(color: textColor ?? Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
