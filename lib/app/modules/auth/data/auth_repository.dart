import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../core/helper/user.dart';
import 'i_auth_repository.dart';

// ignore_for_file: only_throw_errors

class AuthRepository extends IAuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<bool> loginViaEmailPassword({@required String email, @required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      UserData.saveLocalData(userCredential.user);
      return true;
    } on FirebaseAuthException catch (e) {
      _errorFirebase(e);
      return false;
    }
  }

  @override
  Future<bool> loginViaFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();

      final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
      // Once signed in, return the UserCredential
      final userCredential = await _auth.signInWithCredential(facebookAuthCredential);

      UserData.saveLocalData(userCredential.user);
      return true;
    } on FirebaseAuthException catch (e) {
      _errorFirebase(e);
      return false;
    } on FacebookAuthException catch (e) {
      _errorFacebook(e);
      return false;
    }
  }

  @override
  Future<bool> registerViaEmailPassword({@required String email, @required String password}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      UserData.saveLocalData(userCredential.user);
      return true;
    } on FirebaseAuthException catch (e) {
      _errorFirebase(e);
      return false;
    }
  }

  void _errorFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        throw const ErrorUtils(errorMessage: 'Please Enter Valid Email Address');
        break;
      case 'user-disabled':
        throw const ErrorUtils(errorMessage: 'User has been blocked');
        break;
      case 'user-not-found':
        throw const ErrorUtils(errorMessage: 'No user register with this email address');
        break;
      case 'wrong-password':
        throw const ErrorUtils(errorMessage: 'Email or Password is incorrect');
        break;
      case 'email-already-in-use':
        throw const ErrorUtils(errorMessage: 'Email is already register. Kindly try login');
        break;
      case 'weak-password':
        throw const ErrorUtils(errorMessage: 'Please enter valid Strong password');
        break;
      case 'account-exists-with-different-credential':
        throw const ErrorUtils(errorMessage: 'Account is already exists with different credential');
        break;
      case 'invalid-credential':
        throw const ErrorUtils(errorMessage: 'Invalid credential');
        break;
      case 'invalid-verification-code':
        throw const ErrorUtils(errorMessage: 'Please enter valid verification code');
        break;
      case 'invalid-verification-id':
        throw const ErrorUtils(errorMessage: 'Invalid verification ID');
        break;
      case 'operation-not-allowed':
      default:
        throw const ErrorUtils(errorMessage: 'Sorry Something went wrong');
        break;
    }
  }

  void _errorFacebook(FacebookAuthException e) {
    // CANCELLED, FAILED, OPERATION_IN_PROGRESS
    switch (e.errorCode) {
      case 'CANCELLED':
        throw const ErrorUtils(errorMessage: 'Request cancelled');
        break;
      case 'FAILED':
        throw const ErrorUtils(errorMessage: 'Failed to login via Facebook');
        break;
      case 'OPERATION_IN_PROGRESS':
      default:
        throw const ErrorUtils(errorMessage: 'Something went wrong');
        break;
    }
  }
}

class ErrorUtils {
  const ErrorUtils({@required this.errorMessage});

  final String errorMessage;
}
