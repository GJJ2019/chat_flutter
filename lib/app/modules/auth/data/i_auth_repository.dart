import 'package:meta/meta.dart';

abstract class IAuthRepository {
  Future<bool> loginViaEmailPassword({@required String email, @required String password});

  Future<bool> registerViaEmailPassword({@required String email, @required String password});

  Future<bool> loginViaFacebook();
}
