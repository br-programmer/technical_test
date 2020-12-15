import 'package:dio/dio.dart';
import 'package:technical_test/domain/exception/product_exception.dart';
import 'package:technical_test/domain/model/product.dart';
import 'package:technical_test/domain/repository/api_repository.dart';
import 'package:technical_test/domain/request/product_request.dart';
import 'package:technical_test/domain/response/product_response.dart';

class ProductRepositoryImpl extends ApiRepositoryInterface {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://products-nest-api.herokuapp.com',
      connectTimeout: 5000,
      receiveTimeout: 10000,
    ),
  );

  @override
  Future<ProductResponse> getProducts(ProductRequest productRequest) async {
    final Response response = await _dio.get(
      '/product',
      queryParameters: {
        'page': productRequest.page,
        'limit': productRequest.limit,
      },
    );
    if (response.statusCode == 200) {
      List<Product> products = [];
      final list = response.data['results'] as List;
      for (final json in list) {
        products.add(Product.fromJson(json));
      }
      return ProductResponse(products: products);
    } else {
      throw ProductException(name: response.statusMessage, code: response.statusCode);
    }
  }
}
