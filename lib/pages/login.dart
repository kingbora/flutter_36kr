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

  bool _isAgreePolicy = false;

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
                print("点击了切换");
                print(type);
                setState(() {
                  _type = type;
                });
              },
            ),
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Radio(
                  groupValue: _isAgreePolicy ? "agree" : "disagree",
                  value: "agree",
                  onChanged: (String val) {
                    setState(() {
                      _isAgreePolicy = !_isAgreePolicy;
                    });
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text("我已阅读并同意"),
                    InkWell(
                      child: const Text(
                        "《用户协议及隐私政策》",
                        style: TextStyle(color: AppColor.labelCodeColor),
                      ),
                      onTap: () {
                        print("进入用户协议页面");
                      },
                    )
                  ],
                )
              ],
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
