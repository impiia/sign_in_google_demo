import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io' show Platform;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatefulWidget {
  const SignInDemo({Key? key}) : super(key: key);

  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  late GoogleSignIn googleSignIn;

  @override
  void initState() {
    super.initState();
    // Выполните инициализацию GoogleSignIn в методе initState
    initGoogleSignIn();
  }

  Future<void> initGoogleSignIn() async {
    // Инициализация GoogleSignIn в зависимости от платформы
    if (Platform.isAndroid) {
      googleSignIn = GoogleSignIn(scopes: ['email']);
    } else if (Platform.isIOS || Platform.isMacOS) {
      googleSignIn = GoogleSignIn(
        clientId: "Client ID",
        scopes: ['email'],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuthentication =
            await googleAccount.authentication;

        // Получение имени пользователя и электронной почты
        String userName = googleAccount.displayName ?? "";
        String userEmail = googleAccount.email ?? "";

        // Вывод сообщения
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Вы вошли как $userName ($userEmail)'),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    await googleSignIn.signOut();

    // Вывод сообщения после выхода
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Вы вышли из аккаунта'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign-In Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _handleSignIn,
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignOut,
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
