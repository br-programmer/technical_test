import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget newPage;
  FadePageRoute({@required this.newPage, int duration = 600})
      : super(
          pageBuilder: (_, animation, ___) => FadeTransition(opacity: animation, child: newPage),
          transitionDuration: Duration(milliseconds: duration),
        );
}
