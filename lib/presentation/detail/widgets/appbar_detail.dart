import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/my_image.dart';
import 'package:technical_test/presentation/home/home_bloc.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<HomeBLoC>(context, listen: false).product;
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: size.height * .45,
      actions: [
        IconButton(icon: Icon(Icons.share), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
      toolbarHeight: kToolbarHeight,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            child: MyImage(product: product),
          ),
        ),
      ),
    );
  }
}
