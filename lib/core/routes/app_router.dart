import 'package:bekado/presentation/bloc/navigation_bloc.dart';
import 'package:bekado/presentation/pages/authentication/login_page.dart';
import 'package:bekado/presentation/pages/authentication/register_page.dart';
import 'package:bekado/presentation/pages/cart/cart_page.dart';
import 'package:bekado/presentation/pages/home/home_page.dart';
import 'package:bekado/presentation/pages/order_progress/order_progress_page.dart';
import 'package:bekado/presentation/pages/recipe/recipe_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/profil':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartPage());
      case '/orderProgres':
        return MaterialPageRoute(builder: (_) => OrderProgresPage());
      case '/recipe':
        return MaterialPageRoute(builder: (_) => RecipePage());
      case '/MainBottomNav':
        return MaterialPageRoute(builder: (_) => BottomMainNavbar());
      case '/MainBottomNav':
        return MaterialPageRoute(builder: (_) => BottomMainNavbar());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
