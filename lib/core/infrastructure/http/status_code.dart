/// HTTP response status codes indicate whether a specific HTTP request has been successfully completed. Responses are grouped in five classes:

/// Informational responses (100–199)
/// Successful responses (200–299)
/// Redirection messages (300–399)
/// Client error responses (400–499)
/// Server error responses (500–599)
///
/// Read more [here!](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

class StatusCode {
  /// The HTTP 401 error code indicates that the request has not been executed
  /// because it lacks valid authentication credentials for the requested resource.
  static const int unauthorized = 401;

  /// The server cannot or will not process the request due to something
  /// that is perceived to be a client error
  /// (e.g., malformed request syntax, invalid request message
  /// framing, or deceptive request routing).
  static const int badRequest = 400;

  /// The HTTP 200 OK success status response code indicates that the request has
  /// succeeded.
  static const int ok = 200;

  /// The request was successful and a new resource was created as a result.
  ///  This is typically the response sent after a PUT request.
  static const int created = 201;
}
