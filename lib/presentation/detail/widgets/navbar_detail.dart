import 'package:flutter/material.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/common/my_rounded_button.dart';

class NavBarDetail extends StatelessWidget {
  const NavBarDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.2,
        decoration: BoxDecoration(color: AppColors.blueLight, boxShadow: shadow),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: MyRoundedButton(
                  text: 'Preguntar', onPressed: () {}, backgroundColor: Colors.white, textColor: AppColors.greyDark),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: MyRoundedButton(text: '¡Lo quiero!', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
