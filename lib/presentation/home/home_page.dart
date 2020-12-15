import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/loading_animation.dart';
import 'package:technical_test/presentation/home/home_bloc.dart';
import 'package:technical_test/presentation/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const NavBarHome(),
            const LoadingData(),
          ],
        ),
      ),
    );
  }
}

class LoadingData extends StatelessWidget {
  const LoadingData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: Listenable.merge([bloc.products, bloc.loading]),
      child: Padding(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: LoadingAnimation(radius: width * .1, alignment: Alignment.bottomCenter),
      ),
      builder: (_, Widget child) {
        if (bloc.products.value.isNotEmpty && bloc.loading.value) {
          return child;
        }
        return SizedBox.shrink();
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return CustomScrollView(
      controller: bloc.scrollController,
      physics: ClampingScrollPhysics(),
      slivers: [
        const Header(),
        const Options(),
        const GridProducts(),
        const SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight)),
      ],
    );
  }
}
