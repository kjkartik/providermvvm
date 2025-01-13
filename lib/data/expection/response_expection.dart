
class ApiResponseException implements Exception {

  // ignore: prefer_typing_uninitialized_variables
  final _message;

  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  ApiResponseException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message ,$_prefix";
  }
}

//  handel all type of communication error
class CommunicationException extends ApiResponseException{
  CommunicationException([String? message]):super(message,"Error In Communication");
}

// handel if the user not found
class UserNotFound extends ApiResponseException{
  UserNotFound([String? message]):super(message??"","No Data Found");
}

// handel if the internet is not available
class InterNetException extends ApiResponseException{
  InterNetException ([String? message]):super(message,"Please Check Your Internet Connectivity");
}

// handel error if fetch data exception
class FetchDataException extends ApiResponseException{
  FetchDataException([String? message]): super (message,"Error While Communication with server");
}
