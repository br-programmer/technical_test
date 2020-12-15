import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';
import 'package:technical_test/presentation/i_need/widgets/widgets.dart' show ImagePost, Input;

class CreatePost extends StatelessWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('¡Publica tu necesidad!',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: AppColors.greyDark, fontSize: 18)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text('Completa los campos como lo indica la pantalla anterior para publicar lo que necesites',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w400, color: AppColors.grey, fontSize: 17),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 15),
          Input(placeHolder: 'Que necesitas?', maxLines: 1, controller: bloc.controllerNeed),
          const SizedBox(height: 15),
          const ImagePost(),
          const SizedBox(height: 15),
          Input(placeHolder: 'Descripción de lo que necesitas', maxLines: 5, controller: bloc.controllerDescription),
        ],
      ),
    );
  }
}
