import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/common/sliver_header_delegate.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(children: [const _Search(), const _Filter()]),
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle = GoogleFonts.roboto(color: AppColors.greyLight, fontSize: 15);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: size,
        child: CupertinoTextField(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blue, width: 1.25),
              borderRadius: BorderRadius.circular(10),
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RotatedBox(quarterTurns: 1, child: Icon(Icons.search, color: AppColors.blue)),
            ),
            placeholder: 'Que deseas buscar?',
            placeholderStyle: myStyle,
            style: myStyle.copyWith(color: AppColors.greyDark)),
      ),
    );
  }
}

class _Filter extends StatelessWidget {
  const _Filter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange, width: 1.25), borderRadius: BorderRadius.circular(7.5)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: FaIcon(FontAwesomeIcons.slidersH, color: AppColors.orange),
    );
  }
}
