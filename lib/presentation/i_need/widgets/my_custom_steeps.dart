import 'package:flutter/material.dart';
import 'package:technical_test/presentation/common/app_colors.dart';

class MyCustomSteeps extends StatelessWidget {
  const MyCustomSteeps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Icon(Icons.check, size: 15, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _MyStep(color: AppColors.blue, child: child),
          const _SeparatorMyStep(),
          _MyStep(color: AppColors.greyLight, child: null),
        ],
      ),
    );
  }
}

class _SeparatorMyStep extends StatelessWidget {
  const _SeparatorMyStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      width: 55,
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.blue, AppColors.greyLight]),
      ),
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
