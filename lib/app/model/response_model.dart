class Response<T, V> {
  final ResponseStatus _status;
  T? _data;
  V? _error;

  Response.initial() : _status = ResponseStatus.INITIAL;
  Response.loading() : _status = ResponseStatus.LOADING;
  Response.complete(T? data)
      : _status = ResponseStatus.COMPLETE,
        _data = data;
  Response.error(V? error)
      : _status = ResponseStatus.ERROR,
        _error = error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { INITIAL, COMPLETE, ERROR, LOADING }