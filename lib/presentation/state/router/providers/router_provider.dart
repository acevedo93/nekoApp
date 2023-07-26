

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/presentation/state/auth/providers/is_logged_in_provider.dart';

import '../../../screens/home/home_screen.dart';
import '../../../screens/register/register_screen.dart';
import '../../../screens/signIn/signIn_screen.dart';
import '../../../screens/welcome/welcome_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter( 
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/register', builder:(context, state) => const RegisterScreen()),
    GoRoute(path: '/signIn', builder:(context, state) => const SignInScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen())
  ],
  redirect: (context, state)  {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    if(isLoggedIn) {
      return '/home';
    }
    return null;
  }
);
});