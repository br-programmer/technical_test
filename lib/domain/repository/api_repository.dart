import 'package:technical_test/domain/request/product_request.dart';
import 'package:technical_test/domain/response/product_response.dart';

abstract class ApiRepositoryInterface {
  Future<ProductResponse> getProducts(ProductRequest productRequest);
}
