import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class Options extends StatelessWidget {
  const Options({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: options.map((e) => _ItemOptions(text: e)).toList()),
      ),
    );
  }
}

class _ItemOptions extends StatelessWidget {
  const _ItemOptions({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      pressedOpacity: .75,
      child: Container(
        decoration: BoxDecoration(color: AppColors.blue.withOpacity(.1), borderRadius: BorderRadius.circular(7.5)),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: GoogleFonts.roboto(color: AppColors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
