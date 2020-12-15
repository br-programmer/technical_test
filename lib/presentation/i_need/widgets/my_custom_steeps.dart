import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';

class MyCustomSteeps extends StatelessWidget {
  const MyCustomSteeps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    final child = Icon(Icons.check, size: 15, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _MyStep(color: AppColors.blue, child: child),
          const _SeparatorMyStep(),
          ValueListenableBuilder<INeedState>(
            valueListenable: bloc.state,
            builder: (_, state, __) {
              final hasHowToPost = (state == INeedState.howToPost);
              return _MyStep(
                color: hasHowToPost ? AppColors.greyLight : AppColors.blue,
                child: hasHowToPost ? null : child,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SeparatorMyStep extends StatelessWidget {
  const _SeparatorMyStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return ValueListenableBuilder<INeedState>(
      valueListenable: bloc.state,
      builder: (_, state, __) {
        return AnimatedContainer(
          duration: duration,
          width: 60,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blue,
                (state == INeedState.howToPost) ? AppColors.greyLight : AppColors.blue,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MyStep extends StatelessWidget {
  const _MyStep({Key key, this.color, this.child}) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: child,
    );
  }
}
