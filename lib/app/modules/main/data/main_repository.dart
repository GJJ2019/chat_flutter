import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'i_main_repository.dart';
import 'model/github_user_model.dart';
// ignore_for_file: only_throw_errors

class MainRepository extends IMainRepository {
  @override
  Future<List<GithubUserModel>> get() async {
    try {
      final res = await Get.find<Dio>().get('users?since=135');
      final list = <GithubUserModel>[];
      if (res.statusCode == 200) {
        for (final i in res.data) list.add(GithubUserModel.fromJson(i));
        return list;
      } else {
        return throw const ErrorUtils(errorMessage: 'Server is not reachable');
      }
    } on DioError catch (e) {
      return throw _error(e);
    }
  }

  ///
  ErrorUtils _error(DioError e) {
    switch (e.type) {
      case DioErrorType.RESPONSE:
        return const ErrorUtils(
          errorMessage: 'Something went wrong. Please try again after some time.',
        );
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.CONNECT_TIMEOUT:
        return const ErrorUtils(
          errorMessage: 'Server is not reachable. Please verify your internet connection and try again',
        );
        break;

      case DioErrorType.DEFAULT:
        if (e.message.contains('SocketException')) {
          return const ErrorUtils(errorMessage: 'No Internet Connection');
        } else {
          return const ErrorUtils(errorMessage: 'Problem connecting to the server. Please try again.');
        }
        break;

      default:
        return const ErrorUtils(errorMessage: 'Something went wrong');
    }
  }
}

class ErrorUtils {
  const ErrorUtils({@required this.errorMessage});

  final String errorMessage;
}
