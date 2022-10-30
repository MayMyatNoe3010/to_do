class APIResponse{

}
class Success extends APIResponse{
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure extends APIResponse{
  int code;
  Object response;
  Failure({required this.code, required this.response});
}

class Loading extends APIResponse{
  String message;
  Loading({required this.message});
}