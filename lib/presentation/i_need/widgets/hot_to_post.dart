import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class HowToPost extends StatelessWidget {
  const HowToPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/need.png')),
          Text(
            '¡Como publicar tu necesidad!',
            style: GoogleFonts.poppins(color: AppColors.greyDark, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 15),
          _Indication(
            title: 'Que necesitas:',
            detail: 'Ingresa titulo de lo que buscas corto pero descriptivo',
          ),
          const SizedBox(height: 10),
          _Indication(
            title: 'Categoria:',
            detail: 'Elige la categoria donde alguien pueda encontrar tu necesidad',
          ),
          const SizedBox(height: 10),
          _Indication(
            title: 'Descripción:',
            detail:
                'Describe tu necesidad y porque estas buscando este producto, así las personas que lo tienen entenderán porque regalartelo',
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _Indication extends StatelessWidget {
  const _Indication({Key key, @required this.title, @required this.detail}) : super(key: key);
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.roboto(color: AppColors.greyDark, fontWeight: FontWeight.w300, fontSize: 16.5);
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        text: '$title ',
        style: style.copyWith(fontWeight: FontWeight.w700),
        children: [
          TextSpan(text: detail, style: style),
        ],
      ),
    );
  }
}
