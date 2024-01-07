import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_ecommerce/screens/checkout.dart';
import 'package:tech_ecommerce/screens/homescreen.dart';
import 'package:tech_ecommerce/screens/loginscreen.dart';
import 'package:tech_ecommerce/screens/no_favorites.dart';
import 'package:tech_ecommerce/screens/searchscreen.dart';
import 'package:tech_ecommerce/screens/splashscreen.dart';
import 'package:tech_ecommerce/widgets/drawer.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const AppDrawer(child: Home()),
    'splash': (BuildContext contex) => const Splash(),
    'auth': (BuildContext contex) => const Login(),
    'favorites': (BuildContext contex) => const NoFavorites(),
    'checkout': (BuildContext contex) => const Checkout(),
    'busqueda': (BuildContext contex) => const SearchScreen(),
  };
}
