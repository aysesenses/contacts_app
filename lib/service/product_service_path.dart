// ignore_for_file: public_member_api_docs

/// Project service path
enum ProductServicePath {
  user('User');

  const ProductServicePath(this.value);
  final String value;

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
