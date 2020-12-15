import 'package:flutter/material.dart';
import 'package:technical_test/presentation/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [const _Body(), const NavBarHome()],
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
      slivers: [
        const Header(),
        const Options(),
        const GridProducts(),
        const SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight)),
      ],
    );
  }
}
