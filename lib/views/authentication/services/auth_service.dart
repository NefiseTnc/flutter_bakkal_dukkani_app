// ignore_for_file: use_build_context_synchronously
import 'package:bakkal_dukkani/constants/utils.dart';
import 'package:bakkal_dukkani/models/user.dart';
import 'package:bakkal_dukkani/providers/user_provider.dart';
import 'package:bakkal_dukkani/views/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/welcome_screen.dart';
import 'package:bakkal_dukkani/views/authentication/services/i_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/screens/home_screen.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> signUpUser(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((UserCredential userCredential) async {
        var user = userCredential.user!;

        UserModel newUser = UserModel(
            id: user.uid,
            name: name,
            email: email,
            password: password,
            address: '',
            imageUrl: '');

        await _firestore.collection('users').doc(user.uid).set(newUser.toMap());
      });

      showSnackbar(
          context: context,
          message: 'Hesap oluşturuldu! Aynı kimlik bilgileriyle giriş yapın!');

      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

      await sendEmailVerification(context: context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showSnackbar(
            context: context, message: 'Bu e-posta için hesap zaten var');
      } else if (e.code == 'weak-password') {
        showSnackbar(context: context, message: 'Şifre çok zayıf');
      } else if (e.code == 'invalid-email') {
        showSnackbar(context: context, message: 'Geçersiz email');
      } else {
        showSnackbar(context: context, message: e.message!);
      }
    }
  }

  @override
  Future<void> signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((UserCredential userCredential) async {
        var currentUser = userCredential.user;

        if (currentUser != null) {
          if (!currentUser.emailVerified) {
            await sendEmailVerification(context: context);
          }

          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool('user-state', true);

          await _firestore
              .collection('users')
              .doc(currentUser.uid)
              .get()
              .then((DocumentSnapshot doc) {
            if (doc.id == currentUser.uid) {
              UserModel userModel = UserModel(
                id: doc.id,
                name: doc['name'],
                email: email,
                password: password,
                address: doc['address'],
                imageUrl: doc['imageUrl'],
              );

              context.read<UserProvider>().setUser(userModel);
            }
          });

          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(
            context: context,
            message: 'Bu email da bir kullanıcı bulunmamaktadır.');
      } else if (e.code == 'invalid-email') {
        showSnackbar(context: context, message: 'Geçersiz email');
      } else if (e.code == 'wrong-password') {
        showSnackbar(context: context, message: 'Parola yanlış');
      } else {
        showSnackbar(context: context, message: e.message!);
      }
    }
  }

  Future<void> sendEmailVerification({required BuildContext context}) async {
    try {
      _firebaseAuth.currentUser!.sendEmailVerification();
      showSnackbar(
          context: context, message: 'E-posta doğrulaması gönderildi!');
    } on FirebaseAuthException catch (e) {
      showSnackbar(
          context: context, message: e.message!); // Display error message
    }
  }

  @override
  Future<void> signOut({required BuildContext context}) async {
    try {
      await _firebaseAuth.signOut();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('user-state', false);
      Navigator.pushNamedAndRemoveUntil(
          context, WelcomeScreen.routeName, (route) => false);

      showSnackbar(context: context, message: 'Çıkış Yapıldı.');
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, message: e.message!);
    }
  }

  @override
  Future<void> deleteAccount({required BuildContext context}) async {
    try {
      await _firestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .delete();
      await _firebaseAuth.currentUser!.delete();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('user-state', false);
      Navigator.pushNamedAndRemoveUntil(
          context, WelcomeScreen.routeName, (route) => false);
      showSnackbar(context: context, message: 'Hesap Başarıyla Silindi.');
    } on FirebaseAuthException catch (e) {
      showSnackbar(context: context, message: e.message!);
    }
  }
}
