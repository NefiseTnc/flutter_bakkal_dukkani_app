import 'package:flutter/cupertino.dart';

abstract class IAuthService {
  Future<void> signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password});

  Future<void> signInUser(
      {required BuildContext context,
      required String email,
      required String password});


  Future<void> signOut({required BuildContext context});

  Future<void> deleteAccount({required BuildContext context});
}
