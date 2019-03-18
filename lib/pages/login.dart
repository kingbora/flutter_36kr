import 'package:flutter/material.dart';

import 'package:flutter_36kr/stores/stores.dart';
import 'package:flutter_36kr/routes/routes.dart';

import 'package:flutter_36kr/constants/style.dart';

import 'package:flutter_36kr/components/custom_form.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FormType _type = FormType.LOGIN_WITH_CODE;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColor.loginBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColor.bottomBarItemActiveColor),
          onPressed: () {
            Window.router.pop(context);
          },
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "注册",
              style: TextStyle(color: AppColor.bottomBarItemActiveColor),
            ),
            onPressed: () {
              Window.router.navigateTo(context, Routes.register);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fitHeight,
                height: 40.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: CustomForm(
              type: _type,
              changeType: (FormType type) {
                setState(() {
                  _type = type;
                });
              },
              onSubmit: (value) {
                print(value);
              }
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
