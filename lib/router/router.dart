import 'package:go_router/go_router.dart';
import 'package:nekonapp/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/register', builder:(context, state) => const RegisterScreen())
  ]
);
