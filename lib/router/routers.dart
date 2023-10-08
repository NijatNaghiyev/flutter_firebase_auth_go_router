import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_go_router/screen/signup_screen.dart';
import 'package:go_router/go_router.dart';

import '../screen/home_screen.dart';
import '../screen/login_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser != null) {
        return '/home';
      }
      return null;
    },
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'Login',
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'Signup',
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        name: 'Home',
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );
}
