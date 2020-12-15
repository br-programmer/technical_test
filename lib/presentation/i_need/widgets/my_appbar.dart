import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: AppColors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          const Back(),
          Align(
            child: Text(
              'Yo necesito',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class Back extends StatelessWidget {
  const Back({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CupertinoButton(
        child: Icon(Icons.arrow_back, color: Colors.white),
        padding: EdgeInsets.zero,
        onPressed: () {},
      ),
    );
  }
}
