import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:technical_test/presentation/common/fade_page_route.dart';
import 'package:technical_test/presentation/detail/detail_page.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int val = 0;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      sliver: SliverStaggeredGrid.count(
        crossAxisCount: 4,
        children: List.generate(
          10,
          (i) => _ItemGrid(color: Colors.primaries[i % Colors.primaries.length], text: '$i'),
        ),
        staggeredTiles: List.generate(
          10,
          (index) {
            if (index == 0) {
              return StaggeredTile.count(2, 2);
            } else {
              if (val == 0) {
                val++;
                return StaggeredTile.count(2, 3);
              } else if (val < 2) {
                val++;
                return StaggeredTile.count(2, 2);
              } else {
                val = 0;
                return StaggeredTile.count(2, 2);
              }
            }
          },
        ),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}

class _ItemGrid extends StatelessWidget {
  const _ItemGrid({Key key, this.color, this.text}) : super(key: key);
  final Color color;
  final String text;

  void _onTap(BuildContext context) {
    Navigator.push(context, FadePageRoute(newPage: DetailPage(color: color)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Hero(
        tag: color,
        child: Container(
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
          child: FittedBox(child: Text(text)),
        ),
      ),
    );
  }
}
