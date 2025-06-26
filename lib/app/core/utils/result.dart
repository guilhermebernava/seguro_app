class Result<T> {
  final T? data;
  final String? error;

  const Result._({this.data, this.error});

  static Result<T> success<T>(T data) => Result._(data: data);
  static Result<T> failure<T>(String error) => Result._(error: error);

  bool get isSuccess => data != null;
}
