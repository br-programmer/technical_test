import 'package:flutter/material.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key key, this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: size.height * .45,
      actions: [
        IconButton(icon: Icon(Icons.share), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
      toolbarHeight: kToolbarHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            child: Hero(
              tag: color,
              child: Container(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
