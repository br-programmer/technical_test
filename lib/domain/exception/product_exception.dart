class ProductException implements Exception {
  ProductException({this.name, this.code});
  final String name;
  final int code;
}
