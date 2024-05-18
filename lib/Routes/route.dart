import 'package:flutter/material.dart';
import 'package:uts_test/FormScreen/formScreen.dart';
import 'package:uts_test/cart.dart';
import 'package:uts_test/datas_screen.dart';
import 'package:uts_test/event.dart';
import 'package:uts_test/homepage.dart';

class AppRoutes {
  static const String home = '/Homepage';
  static const String event = '/Eventpage';
  static const String Cart = '/Cartpage';
  static const String datas = '/datas';
  static const String formScreen = '/create';
  static const String editScreen = '/edit';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => MyHomePage());
        case event:
        return MaterialPageRoute(builder: (_) => EventPage());
        case Cart:
        return MaterialPageRoute(builder: (_) => CartPage());
      case datas:
        return MaterialPageRoute(builder: (_) => DatasScreen());
        case formScreen:
        return MaterialPageRoute(builder: (_) => FormScreenApi());
        case formScreen:
        return MaterialPageRoute(builder: (_) => FormScreenApi());
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