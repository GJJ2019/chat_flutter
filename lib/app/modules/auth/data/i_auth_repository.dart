import 'package:meta/meta.dart';

abstract class IAuthRepository {
  Future<void> loginViaEmailPassword({@required String email, @required String password});

  Future<bool> registerViaEmailPassword({@required String email, @required String password});

  Future<void> loginViaFacebook();
}
