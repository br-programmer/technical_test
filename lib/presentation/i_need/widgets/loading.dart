import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/loading_animation.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';

class Loading extends StatelessWidget {
  const Loading({Key key, this.color = Colors.transparent}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: bloc.isLoading,
      child: Container(
        color: color,
        child: LoadingAnimation(
          radius: MediaQuery.of(context).size.width * .15,
        ),
      ),
      builder: (_, loading, Widget child) {
        if (loading) {
          return child;
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
