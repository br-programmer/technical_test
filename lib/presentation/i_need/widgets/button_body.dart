import 'package:flutter/material.dart';
import 'package:technical_test/presentation/common/my_rounded_button.dart';

class ButtonBody extends StatelessWidget {
  const ButtonBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyRoundedButton(
      text: 'Continuar',
      onPressed: () {},
    );
  }
}
