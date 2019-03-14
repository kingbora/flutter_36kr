import 'package:flutter/material.dart';

import 'package:flutter_36kr/constants/style.dart';

class CustomForm extends StatefulWidget {
  CustomForm({Key key, @required this.type, this.changeType}) : super(key: key);

  final FormType type;
  final Function changeType;
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  //手机号
  String _phone;
  //密码
  String _password;
  //验证码
  String _code;

  Widget _buildPhoneInput(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              child: Container(
                width: 40.0,
                child: Center(
                  child: Text("+86"),
                ),
              ),
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: const Text("选择框"),
                      );
                    });
              },
            ),
            Container(
              width: 1.0,
              height: 10.0,
              color: Color(0xff111111),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "输入手机号",
                  labelStyle: TextStyle(color: AppColor.textIndentColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                onSaved: (val) {
                  _phone = val;
                },
              ),
            )
          ],
        ),
        Divider(
          height: 1.0,
          color: AppColor.dividerLineColor,
        )
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      children: <Widget>[
        Container(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "输入密码",
              labelStyle: TextStyle(color: AppColor.textIndentColor),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            obscureText: true,
            onSaved: (val) {
              _password = val;
            },
          ),
        ),
        Divider(
          height: 1.0,
          color: AppColor.dividerLineColor,
        )
      ],
    );
  }

  Widget _buildCodeInput() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "输入验证码",
                  labelStyle: TextStyle(color: AppColor.textIndentColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                onSaved: (val) {
                  _code = val;
                },
              ),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  "获取验证码",
                  style: TextStyle(color: AppColor.labelCodeColor),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        Divider(
          height: 1.0,
          color: AppColor.dividerLineColor,
        )
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0xffA3ACF6), Color(0xff9EBBF4)],
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Center(
          child: const Text(
            "登录",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: _handleFormSubmit,
      ),
    );
  }

  Widget _buildTapLink() {
    Widget _leftWidget = Expanded(
      flex: 1,
      child: Container(),
    );
    Widget _rightWidget = _leftWidget;

    switch (widget.type) {
      case FormType.REGISTER:
      case FormType.LOGIN_WITH_CODE:
        _rightWidget = Container(
          child: Row(
            children: <Widget>[
              const Text("你也可以尝试"),
              InkWell(
                child: const Text(
                  "接听语音验证码",
                  style: TextStyle(color: AppColor.labelCodeColor),
                ),
                onTap: () {
                  print("切换");
                },
              )
            ],
          ),
        );
        break;
      case FormType.LOGIN_WITH_PASSWORD:
        _rightWidget = InkWell(
          child: const Text("忘记密码?"),
          onTap: () {
            print("忘记密码");
          },
        );
        break;
      default:
    }

    return Container(
        width: double.infinity,
        height: 40.0,
        child: Row(
          children: <Widget>[_leftWidget, _rightWidget],
        ));
  }

  Widget _buildChangeType() {
    switch (widget.type) {
      case FormType.LOGIN_WITH_CODE:
        return Container(
          height: 60.0,
          child: Center(
            child: InkWell(
              child: const Text(
                "手机号密码登录",
                style: TextStyle(color: AppColor.labelCodeColor),
              ),
              onTap: () {
                widget.changeType(FormType.LOGIN_WITH_CODE);
              },
            ),
          ),
        );
      case FormType.LOGIN_WITH_PASSWORD:
        return Container(
          height: 60.0,
          child: Center(
            child: InkWell(
              child: const Text(
                "验证码登录",
                style: TextStyle(color: AppColor.labelCodeColor),
              ),
              onTap: () {
                widget.changeType(FormType.LOGIN_WITH_PASSWORD);
              },
            ),
          ),
        );
      default:
        return null;
    }
  }

  List<Widget> _renderFormItem(BuildContext context) {
    List<Widget> formItems = [];

    formItems.add(_buildPhoneInput(context));

    if (widget.type == FormType.LOGIN_WITH_PASSWORD ||
        widget.type == FormType.REGISTER) {
      formItems.add(_buildPasswordInput());
    }

    if (widget.type == FormType.LOGIN_WITH_CODE ||
        widget.type == FormType.REGISTER) {
      formItems.add(_buildCodeInput());
    }

    formItems.add(_buildTapLink());

    if (widget.type != FormType.REGISTER) {
      formItems.add(_buildChangeType());
    }

    formItems.add(_buildSubmitButton());

    return formItems;
  }

  void _handleFormSubmit() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_phone);
      print(_password);
      print(_code);
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: _renderFormItem(context),
      ),
    );
  }
}

enum FormType { LOGIN_WITH_PASSWORD, LOGIN_WITH_CODE, REGISTER }
