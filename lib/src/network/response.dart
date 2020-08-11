class Response<T> {
  Status status;
  T data;
  String message;

  Response.loading(this.message) : status = Status.LOADING;
  Response.successful(this.message) : status = Status.SUCCESS;
  Response.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}

enum Status { LOADING, SUCCESS, ERROR }
