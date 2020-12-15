import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:technical_test/domain/model/product.dart';
import 'package:technical_test/domain/repository/api_repository.dart';
import 'package:technical_test/domain/request/product_request.dart';

class HomeBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;
  int _page = 1;

  ValueNotifier<List<Product>> _products;
  Product _product;
  ScrollController _scrollController;
  bool _loading;
  ValueNotifier<List<Product>> get products => _products;
  Product get product => _product;
  ScrollController get scrollController => _scrollController;

  HomeBLoC({@required this.apiRepositoryInterface}) {
    _init();
  }

  void _init() {
    _products = ValueNotifier<List<Product>>([]);
    _product = Product();
    _loading = true;
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
    _loadData();
  }

  Future<void> _loadData() async {
    _loading = true;
    final response = await apiRepositoryInterface.getProducts(ProductRequest(page: _page, limit: 7));
    final tmp = List<Product>.from(_products.value);
    if (response != null) {
      tmp.addAll(response.products);
      _products.value = tmp;
    }
    _loading = false;
  }

  void _scrollListener() {
    if ((scrollController.offset + 250 >= scrollController.position.maxScrollExtent) &&
        (scrollController.position.userScrollDirection == ScrollDirection.reverse) &&
        !_loading) {
      _page++;
      _loadData();
    }
  }

  void setProduct(Product product) => _product = product;

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }
}
