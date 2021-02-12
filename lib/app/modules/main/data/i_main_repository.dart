import 'model/github_user_model.dart';

abstract class IMainRepository {
  Future<List<GithubUserModel>> get();
}
