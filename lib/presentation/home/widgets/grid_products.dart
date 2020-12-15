import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/domain/model/product.dart';
import 'package:technical_test/presentation/common/fade_page_route.dart';
import 'package:technical_test/presentation/common/my_image.dart';
import 'package:technical_test/presentation/common/loading_animation.dart';
import 'package:technical_test/presentation/detail/detail_page.dart';
import 'package:technical_test/presentation/home/home_bloc.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int val = 0;
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder<List<Product>>(
      valueListenable: bloc.products,
      child: SliverFillRemaining(child: LoadingAnimation(radius: width * .15)),
      builder: (_, products, child) {
        if (products.isEmpty) {
          return child;
        } else {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            sliver: SliverStaggeredGrid.count(
              crossAxisCount: 4,
              children: products.map((e) => _ItemGrid(product: e)).toList(),
              staggeredTiles: List.generate(
                products.length,
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
      },
    );
  }
}

class _ItemGrid extends StatelessWidget {
  const _ItemGrid({Key key, this.product}) : super(key: key);
  final Product product;

  void _onTap(BuildContext context) {
    Provider.of<HomeBLoC>(context, listen: false).setProduct(product);
    Navigator.push(context, FadePageRoute(newPage: DetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(onTap: () => _onTap(context), child: MyImage(product: product)),
    );
  }
}
