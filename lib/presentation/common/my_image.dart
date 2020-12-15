import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/domain/model/product.dart';

class MyImage extends StatelessWidget {
  final Product product;

  const MyImage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: CachedNetworkImage(
        imageUrl: product.image,
        fit: BoxFit.cover,
        placeholder: (_, __) => Image.asset('assets/images/loading.gif', fit: BoxFit.cover),
      ),
    );
  }
}
