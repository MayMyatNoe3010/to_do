
class APIStateWrapper {
  APIState apiState;
  Object? data;
  String message;

  APIStateWrapper(
      {required this.apiState, required this.data, required this.message});
}

class APIResponseState<T> {
  APIState apiState;
  T? data;
  String message;
  int pageNo;
  int totalCount;
  bool isReachToEnd = false;

  APIResponseState(
      {required this.apiState,
      required this.data,
      required this.message,
      required this.totalCount,
      required this.pageNo});
}

enum APIState {
  idle,
  success,
  loading,
  error,
  errorNoData,
  errorInvalidResponse,
  errorNoInternet
}
