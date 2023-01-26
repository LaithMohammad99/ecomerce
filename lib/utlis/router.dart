import 'package:ecommercapp/pages/auth_pages.dart';
import 'package:ecommercapp/pages/bottom_nav_bar.dart';
import 'package:ecommercapp/pages/landing_page.dart';
import 'package:ecommercapp/pages/view_all_pages.dart';
import 'package:ecommercapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.LoginPageRoutes:
      return CupertinoPageRoute(builder: (_) => const AuthPage(),settings: settings);
    case AppRoutes.bottomNavBarRoute:
      return CupertinoPageRoute(builder: (_) => const BottomNavBar(),settings: settings);
    case AppRoutes.ViewAllPage:
      return CupertinoPageRoute(builder: (_) => const ViewAllPage(),settings:
      settings);
    case AppRoutes.landingPageRoutes:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage(),
          settings:settings);

  }
}