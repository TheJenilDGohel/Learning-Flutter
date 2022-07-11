import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/detailed_items_page.dart';
import 'package:flutter_application_1/themes/themes.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: MyRoutes.homeRoute,
      // routes: {
      // "/": (context) => Loginpage(),
      // MyRoutes.homeRoute: (context) => HomePage(),
      // MyRoutes.loginRoute: (context) => Loginpage(),
      // MyRoutes.cartRoute: (context) => CartPage(),
      // },
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: Loginpage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.detailedItemsRoute: (uri, params) {
          return MaterialPage(
            child: DetailedItemsPage(
              catalog: params,
            ),
          );
        },
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: Loginpage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
      }),
    );
  }
}
