import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_36kr/routes/router_handler.dart';

class Routes {
  static String root = "/home/:tabIndex";
  static String login = "/login";
  static String register = "/register";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      }
    );

    //主入口
    router.define(root, handler: homeHandler);

    router.define(login, handler: loginHandler);

    router.define(register, handler: registerHandler);
  }
}