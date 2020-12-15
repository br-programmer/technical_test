import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';
import 'package:technical_test/presentation/i_need/widgets/widgets.dart' show OptionsSelectImage;

class ImagePost extends StatelessWidget {
  const ImagePost({Key key}) : super(key: key);

  void _onTap(BuildContext context) => showCupertinoModalPopup(
        context: context,
        builder: (_) => const OptionsSelectImage(),
      );

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return GestureDetector(
      onTap: () => _onTap(context),
      child: ValueListenableBuilder<File>(
        valueListenable: bloc.file,
        builder: (_, file, __) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: AppColors.blueLight,
                child: file != null
                    ? Image.file(file, fit: BoxFit.cover)
                    : FittedBox(child: Icon(Icons.image_search, color: AppColors.greyDark)),
              ),
            ),
          );
        },
      ),
    );
  }
}
