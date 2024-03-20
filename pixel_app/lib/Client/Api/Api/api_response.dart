enum Status { INITIAL, LOADING, COMPLETE, ERROR }

class ApiResponse<T> {
  T? data;
  String? message;
  Status? status;

  ApiResponse.initial([this.message]) : status = Status.INITIAL;

  ApiResponse.loading([this.message]) : status = Status.LOADING;

  ApiResponse.error([this.message]) : status = Status.ERROR;

  ApiResponse.complete([this.data]) : status = Status.COMPLETE;
}
