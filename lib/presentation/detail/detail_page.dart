import 'package:flutter/material.dart';
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
            const _Body(),
            const NavBarDetail(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [AppBarDetail(), const DetailBody()],
    );
  }
}
