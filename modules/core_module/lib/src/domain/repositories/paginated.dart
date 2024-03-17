/// Enum representing the order direction for paginated queries.
enum OrderBy {
  /// Ascending order.
  asc,

  /// Descending order.
  desc
}

/// Represents a paginated result containing a subset of data.
final class Paginated<T> {
  /// Total count of items.
  final int count;

  /// Maximum number of items per page.
  final int limit;

  /// Current page number.
  final int page;

  /// List of data for the current page.
  final List<T> data;

  /// Constructs a [Paginated] instance with the provided parameters.
  Paginated({
    required this.count,
    required this.limit,
    required this.page,
    required this.data,
  });
}

/// Represents parameters for paginated queries.
final class PaginatedQueryParams {
  /// Maximum number of items per page.
  final int limit;

  /// Current page number.
  final int page;

  /// Offset for paginated queries.
  final int offset;

  /// Order direction for paginated queries.
  final OrderBy orderBy;

  /// Constructs a [PaginatedQueryParams] instance with the provided parameters.
  PaginatedQueryParams({
    required this.limit,
    required this.page,
    required this.offset,
    required this.orderBy,
  });
}
