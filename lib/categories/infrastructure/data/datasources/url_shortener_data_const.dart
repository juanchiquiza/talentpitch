/// Enum with the constant values of the Url Shortener data layer
enum UrlShortenerDataConst {
  /// Endpoint to get complete information about contest
  urlShortenerEndPoint('api/homeservice/categories/all/12');

  /// Constructor
  const UrlShortenerDataConst(this.value);

  /// Value of each enum
  final String value;
}
