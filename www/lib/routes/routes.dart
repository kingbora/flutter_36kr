import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_36kr/routes/router_handler.dart';

class Routes {
  static Router routes;
  //过渡页
  static String root = "/root";
  //主入口, tab页
  static String home = "/home/:tabIndex";
  //登录
  static String login = "/login";
  //设置密码
  static String confirmPsw = "/confirm";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {

      }
    );

    router.define(root, handler: splashHandler);

    //主入口
    router.define(home, handler: homeHandler);

    router.define(login, handler: loginHandler);

    router.define(confirmPsw, handler: confirmPasswordHandler);
  }
}