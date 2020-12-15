import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';

class OptionsSelectImage extends StatelessWidget {
  const OptionsSelectImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'AGREGAR UNA FOTO',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppColors.blue, fontSize: 17),
              ),
            ),
            _Option(
              text: 'Tomar una foto',
              onPressed: () async {
                await bloc.takePhoto();
                Navigator.pop(context);
              },
            ),
            Divider(height: 0, color: AppColors.greyDark),
            _Option(
              text: 'Seleccionar una foto',
              onPressed: () async {
                await bloc.selectPhoto();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({Key key, @required this.text, @required this.onPressed}) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: .8,
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.roboto(fontSize: 16, color: AppColors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
