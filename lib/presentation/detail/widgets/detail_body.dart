import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: shadow,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('Portatil mac 2012', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18)),
          const SizedBox(height: 7.5),
          Text('Antofagasta',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.grey)),
          _Characteristic(title: 'Publicado:', detail: 'Sep 16 2020'),
          const SizedBox(height: 15),
          _Characteristic(title: 'Estado:', detail: 'Excelente'),
          const SizedBox(height: 15),
          _Characteristic(
              title: 'Descripción:',
              detail:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ]),
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
