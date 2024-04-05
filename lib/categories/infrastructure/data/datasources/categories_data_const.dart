/// Enum with the constant values of the Categories Data layer
enum CategoriesDataConst {
  /// Endpoint to get information about Categories
  urlCategoriesEndPoint('api/homeservice/categories/all/12');

  /// Constructor
  const CategoriesDataConst(this.value);

  /// Value of each enum
  final String value;
}
