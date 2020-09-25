import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:span/src/screens/main_screen.dart';
import 'package:span/src/screens/sign_in.dart';

import 'package:span/src/utils/size_config.dart';

class SignUp extends StatefulHookWidget {
  final SharedPreferences prefs;
  SignUp({this.prefs});
  @override
  _SignUpState createState() => _SignUpState();
}

enum FormMode { REGISTER }

class _SignUpState extends State<SignUp> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String _errorMessage;

  bool _isLoading;
  bool _obscurePassword = true;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xFFEEF4F3),
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Center(
            child: SingleChildScrollView(
              child: _showBody(context),
            ),
          ),
        ));
  }

  Widget _showBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Create your account',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 4,
            ),
            Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  _showErrorMessage(),
                  _showName(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  _showEmailInput(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  _showPasswordInput(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 2),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 2.5),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: _isLoading
                                ? Colors.grey
                                : Theme.of(context).primaryColor,
                            child: Text(
                              _isLoading ? 'Loading' : 'Sign Up',
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 4,
                  ),
                  _showSwitchToLogin(),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 5,
            ),
          ],
        ));
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          _errorMessage,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    } else {
      return Container(
        height: 0.0,
      );
    }
  }

  Widget _showSwitchToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => SignIn(
                  prefs: widget.prefs,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Already have an account \? Login',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showEmailInput() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 8,
          vertical: SizeConfig.safeBlockVertical,
        ),
        child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            icon: Icon(
              FontAwesomeIcons.envelope,
              color: Theme.of(context).primaryColor,
            ),
          ),
          controller: emailController,
          validator: (value) {
            if (value.isEmpty) {
              return "e-mail cannot be empty!";
            }

            if (value.length > 32) {
              return "e-mail too long!";
            }
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return "invalid e-mail!";
            }

            return null;
          },
        ),
      ),
    );
  }

  Widget _showName() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 8,
          vertical: SizeConfig.safeBlockVertical,
        ),
        child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          autofocus: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Full names',
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                FontAwesomeIcons.idBadge,
                color: Theme.of(context).primaryColor,
              )),
          controller: nameController,
          validator: (value) {
            if (value.isEmpty) {
              return "name cannot be empty";
            }

            if (value.length > 64) {
              return "name too long!";
            }

            return null;
          },
        ),
      ),
    );
  }

  Widget _showPasswordInput() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 8,
            vertical: SizeConfig.safeBlockVertical),
        child: TextFormField(
          maxLines: 1,
          obscureText: _obscurePassword,
          autofocus: false,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => setState(() {
                _obscurePassword = !_obscurePassword;
              }),
              child: _obscurePassword
                  ? Icon(
                      FontAwesomeIcons.eyeSlash,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      FontAwesomeIcons.eye,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
            border: InputBorder.none,
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            icon: Icon(
              FontAwesomeIcons.lock,
              color: Theme.of(context).primaryColor,
            ),
          ),
          controller: passwordController,
          validator: (value) {
            if (value.isEmpty) {
              return "password cannot be empty!";
            }
            if (value.length < 6) {
              return "password too short!";
            }

            if (value.length > 32) {
              return "password too long!";
            }
            return null;
          },
        ),
      ),
    );
  }
}
