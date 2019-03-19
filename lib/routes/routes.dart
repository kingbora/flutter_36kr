import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_36kr/routes/router_handler.dart';

class Routes {
  static Router routes;
  static String root = "/root";
  static String home = "/home/:tabIndex";
  static String login = "/login";
  static String register = "/register";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      }
    );

    router.define(root, handler: splashHandler);

    //主入口
    router.define(home, handler: homeHandler);

    router.define(login, handler: loginHandler);

    router.define(register, handler: registerHandler);
  }
}