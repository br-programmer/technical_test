import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/home/home_bloc.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<HomeBLoC>(context, listen: false).product;
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            boxShadow: shadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(product.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(height: 7.5),
              Text(product.location,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.grey)),
              _Characteristic(title: 'Publicado:', detail: product.date),
              const SizedBox(height: 15),
              _Characteristic(title: 'Estado:', detail: product.status),
              const SizedBox(height: 15),
              Expanded(child: _Characteristic(title: 'Descripción:', detail: product.description)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Characteristic extends StatelessWidget {
  const _Characteristic({Key key, @required this.title, @required this.detail}) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final myStyle = GoogleFonts.roboto(color: AppColors.greyDark, fontWeight: FontWeight.w300, fontSize: 16.5);
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
          text: '$title ',
          style: myStyle.copyWith(fontWeight: FontWeight.w600),
          children: [TextSpan(text: detail, style: myStyle)]),
    );
  }
}
