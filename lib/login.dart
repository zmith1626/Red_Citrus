import 'package:flutter/material.dart';
import './ui_elements/styling_element.dart';
import './colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _buildEmailTextFormField() {
      return TextFormField(
        controller: _emailController,
        style: monospaceWhiteTextStyle(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            labelText: 'Email',
            labelStyle: monospaceWhiteTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle(),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        validator: (String value) {
          if (value.isEmpty) {
            return '* Email is required';
          }
          if (!value.contains('@')) {
            return '* Enter a valid Email';
          }
          return null;
        },
      );
    }

    Widget _buildPasswordTextFormField() {
      return TextFormField(
        obscureText: true,
        controller: _passwordController,
        style: monospaceWhiteTextStyle(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            labelText: 'Password',
            labelStyle: monospaceWhiteTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle(),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        validator: (String value) {
          if (value.isEmpty) {
            return '* Pasword is required';
          }
          if (value.length < 6) {
            return '* Minimum length should be 6 digits';
          }
          return null;
        },
      );
    }

    BoxDecoration _buildLinearGradient() {
      return BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.4,
            0.8,
          ],
              colors: [
            kBlueGradienttop,
            kBlueGradientBottom
          ]));
    }

    Widget _buildButtonBar() {
      return ButtonBar(
        children: <Widget>[
          FlatButton(
            child: Text('Sign Up', style: monospaceBlackBoldTextStyle()),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text('Sign In', style: monospaceBlackBoldTextStyle()),
              onPressed: _validateForm)
        ],
      );
    }

    Widget _buildHeader() {
      return Column(children: <Widget>[
        Image.asset('assets/send-message-button.png', height: 80, width: 80),
        SizedBox(height: 16.0),
        Text('BLUE',
            style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ))
      ]);
    }

    return Scaffold(
      body: Container(
        decoration: _buildLinearGradient(),
        child: SafeArea(
          child: Form(
            key: _loginFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height: 80.0),
                _buildHeader(),
                SizedBox(height: 36.0),
                _buildEmailTextFormField(),
                SizedBox(height: 8.0),
                _buildPasswordTextFormField(),
                SizedBox(height: 8.0),
                _buildButtonBar(),
                FlatButton(
                  child: Text('Forgot Password',
                      style: monospaceBlackBoldTextStyle()),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Resend Verification Link',
                      style: monospaceBlackBoldTextStyle()),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (!_loginFormKey.currentState.validate()) {
      return;
    }
    _signInWithEmailAndPassword();
  }

  void _signInWithEmailAndPassword() async {}
}
