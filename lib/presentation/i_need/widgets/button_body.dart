import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/fade_page_route.dart';
import 'package:technical_test/presentation/common/my_rounded_button.dart';
import 'package:technical_test/presentation/home/home_page.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';

class ButtonBody extends StatelessWidget {
  const ButtonBody({Key key}) : super(key: key);

  void _onPressed(BuildContext context, INeedBLoC bloc) async {
    await bloc.nextPage();
    Navigator.pushReplacement(context, FadePageRoute(newPage: HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return AnimatedBuilder(
      animation: Listenable.merge([bloc.state, bloc.isCompleted]),
      builder: (_, __) {
        final hasHowToPost = (bloc.state.value == INeedState.howToPost);
        final isCompleted = bloc.isCompleted.value;
        return MyRoundedButton(
          text: hasHowToPost ? 'Continuar' : 'Publicar',
          padding: 15,
          onPressed: hasHowToPost
              ? () => bloc.setNewState(INeedState.createPost)
              : isCompleted
                  ? () => _onPressed(context, bloc)
                  : null,
        );
      },
    );
  }
}
