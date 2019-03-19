import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_36kr/constants/style.dart';

class CustomForm extends StatefulWidget {
  CustomForm({Key key, @required this.type, this.changeType, this.onSubmit})
      : super(key: key);

  final FormType type;
  final ValueChanged<FormType> changeType;
  final ValueChanged onSubmit;
  final int countdown = 60; //默认60s
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

  //倒计时计时器
  Timer _timer;
  //当前倒计时的秒数
  int _seconds;
  String _verifyStr = '获取验证码';

  bool _isAgreePolicy = false;

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  //启动倒计时
  void _startTimer() {
    setState(() {
      _verifyStr = '已发送$_seconds' + 's';
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds' + 's';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  //取消倒计时
  void _cancelTimer() {
    _timer?.cancel();
  }

  String validatorPhone(value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }

    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return "密码不能为空";
    }

    return null;
  }

  String validatorCode(value) {
    if (value.isEmpty) {
      return "验证码不能为空";
    }

    return null;
  }

  Widget _buildPhoneInput() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "输入手机号",
                  labelStyle: TextStyle(color: AppColor.textIndentColor),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.dividerLineColor)),
                  helperText: '',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                onSaved: (val) {
                  _phone = val;
                },
                validator: validatorPhone,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordInput() {
    return Column(
      children: <Widget>[
        Container(
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "输入密码",
              labelStyle: TextStyle(color: AppColor.textIndentColor),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.dividerLineColor)),
              helperText: '',
              contentPadding: EdgeInsets.all(10.0),
            ),
            obscureText: true,
            onSaved: (val) {
              _password = val;
            },
            validator: validatorPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeInput() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "输入验证码",
                    labelStyle: TextStyle(color: AppColor.textIndentColor),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.dividerLineColor)),
                    helperText: '',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  onSaved: (val) {
                    _code = val;
                  },
                  validator: validatorCode),
            ),
            Positioned(
              right: 0.0,
              top: 5.0,
              child: FlatButton(
                child: Text(
                  _verifyStr,
                  style: TextStyle(color: AppColor.labelCodeColor),
                ),
                onPressed: (_verifyStr == '重新发送' || _verifyStr == '获取验证码')
                    ? _startTimer
                    : null,
              ),
            )
          ],
        ),
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
      case FormType.LOGIN_WITH_PASSWORD:
        return Container(
          height: 60.0,
          child: Center(
            child: InkWell(
              child: const Text(
                "手机号密码登录",
                style: TextStyle(color: AppColor.labelCodeColor),
              ),
              onTap: () {
                _formKey.currentState.reset();
                widget.changeType(FormType.LOGIN_WITH_CODE);
              },
            ),
          ),
        );
      case FormType.LOGIN_WITH_CODE:
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

  Widget _buildPolicy() {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Radio(
            groupValue: _isAgreePolicy,
            value: true,
            onChanged: (bool val) {
              if (val != _isAgreePolicy) {
                setState(() {
                  _isAgreePolicy = val;
                });
              }
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
    );
  }

  List<Widget> _renderFormItem() {
    List<Widget> formItems = [];

    formItems.add(_buildPhoneInput());

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

    formItems.add(_buildPolicy());

    return formItems;
  }

  void _handleFormSubmit() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      switch (widget.type) {
        case FormType.LOGIN_WITH_CODE:
          widget.onSubmit({"phone": _phone, "code": _code});
          break;
        case FormType.LOGIN_WITH_PASSWORD:
          widget.onSubmit({"phone": _phone, "password": _password});
          break;
        case FormType.REGISTER:
          widget.onSubmit(
              {"phone": _phone, "password": _password, "code": _code});
          break;
        default:
      }
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: _renderFormItem(),
      ),
    );
  }
}

enum FormType { LOGIN_WITH_PASSWORD, LOGIN_WITH_CODE, REGISTER }
