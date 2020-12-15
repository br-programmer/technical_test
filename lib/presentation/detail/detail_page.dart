import 'package:flutter/material.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/common/my_rounded_button.dart';
import 'package:technical_test/presentation/detail/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final Color color;

  const DetailPage({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _Body(color: color),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: kBottomNavigationBarHeight * 1.2,
                decoration: BoxDecoration(color: AppColors.blueLight, boxShadow: shadow),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: MyRoundedButton(
                        text: 'Preguntar',
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        textColor: AppColors.greyDark,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: MyRoundedButton(
                        text: '¡Lo quiero!',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key, @required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppBarDetail(color: color),
        const DetailBody(),
      ],
    );
  }
}
