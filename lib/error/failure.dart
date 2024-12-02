import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  static String fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection Timeout';

      case DioExceptionType.sendTimeout:
        return 'Send Timeout With Api Server';

      case DioExceptionType.receiveTimeout:
        return 'Receive Timeout With Api Server';

      case DioExceptionType.badCertificate:
        return 'Bad Certificate With Api Server';

      case DioExceptionType.badResponse:
        return fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return 'Request to Api Server was Canceled';

      case DioExceptionType.connectionError:
        return 'Connection Error';

      case DioExceptionType.unknown:
        return 'Unexpected Error Occured, Please Try Again!';

      default:
        return 'Oops, There was an Error';
    }
  }

  static String fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return response['error']['message'];
    } else if (statusCode == 404) {
      return 'Your Request Not Found, Please Try Again Later!';
    } else if (statusCode == 500) {
      return 'Internal Server Error, Please Try Again Later!';
    } else {
      return 'Oops, There was an Error, Please Try Again Later!';
    }
  }
}
