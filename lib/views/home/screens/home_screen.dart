import 'package:bakkal_dukkani/providers/user_provider.dart';
import 'package:bakkal_dukkani/views/authentication/services/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Home Screen'),
          Text(user.email),
          ElevatedButton(
              onPressed: () {
                context.read<IAuthService>().signOut(context: context);
              },
              child: const Text('Çıkış Yap')),
          ElevatedButton(
              onPressed: () {
                context.read<IAuthService>().deleteAccount(context: context);
              },
              child: const Text('Hesabı Sil')),
        ],
      ),
    );
  }
}
