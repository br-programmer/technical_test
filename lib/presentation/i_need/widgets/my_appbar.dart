import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';

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
            child: Text('Yo necesito',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
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
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return ValueListenableBuilder<INeedState>(
      valueListenable: bloc.state,
      builder: (_, state, __) => Align(
        alignment: Alignment.centerLeft,
        child: CupertinoButton(
          child: Icon(Icons.arrow_back, color: Colors.white),
          padding: EdgeInsets.zero,
          onPressed: (state == INeedState.createPost) ? () => bloc.setNewState(INeedState.howToPost) : null,
        ),
      ),
    );
  }
}
