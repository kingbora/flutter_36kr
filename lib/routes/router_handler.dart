import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_36kr/main.dart';
import 'package:flutter_36kr/pages/login.dart';
import 'package:flutter_36kr/pages/confirm_password.dart';
import 'package:flutter_36kr/views/splash.dart';

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MyAppEntry();
  }
);

var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Login();
  }
);

var confirmPasswordHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new ConfirmPassword();
  }
);

var splashHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new Splash();
  }
);