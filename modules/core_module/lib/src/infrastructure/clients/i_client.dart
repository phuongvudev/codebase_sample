/// Interface representing a client.
abstract class IClient {
  /// Initializes the client.
  void initialize();

  /// Disposes the client.
  void dispose();

  /// Closes the client.
  void close();
}
