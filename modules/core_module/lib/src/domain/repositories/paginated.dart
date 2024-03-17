enum OrderBy { asc, desc }

final class Paginated<T> {
  final int count;
  final int limit;
  final int page;
  final List<T> data;

  Paginated({
    required this.count,
    required this.limit,
    required this.page,
    required this.data,
  });
}

final class PaginatedQueryParams {
  final int limit;
  final int page;
  final int offset;
  final OrderBy orderBy;

  PaginatedQueryParams(
      {required this.limit,
      required this.page,
      required this.offset,
      required this.orderBy});
}


