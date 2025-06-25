import 'package:flutter/material.dart';
import '../presentation/pages/account_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/home_page.dart';
import 'app_routes.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case AppRoutes.account:
        print('Hi');
        return MaterialPageRoute(builder: (_) => const AccountPage());
      default:
        return MaterialPageRoute(
          builder: (context) {
            // Affiche un SnackBar après le build
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Route inconnue, redirection vers l'accueil"),
                ),
              );
            });
            return const HomePage();
          },
        );
    }
  }
}
