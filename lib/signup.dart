import 'package:flutter/material.dart';
import './ui_elements/styling_element.dart';
import './colors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  String _inputPassword;
  bool _acceptTermsCondtnChecked = false;

  @override
  Widget build(BuildContext context) {
    Widget _buildNameTextFormField() {
      return TextFormField(
        style: monospaceWhiteItalicTextStyle(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            filled: true,
            labelText: 'Name',
            labelStyle: monospaceWhiteItalicTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle()),
        validator: (String value) {
          if (value.isEmpty) {
            return '* Name is required';
          }
          return null;
        },
      );
    }

    Widget _buildEmailTextFormField() {
      return TextFormField(
        style: monospaceWhiteItalicTextStyle(),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            filled: true,
            labelText: 'Email',
            labelStyle: monospaceWhiteItalicTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle()),
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
        keyboardType: TextInputType.text,
        obscureText: true,
        style: monospaceWhiteItalicTextStyle(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            filled: true,
            labelText: 'Password',
            labelStyle: monospaceWhiteItalicTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle()),
        validator: (String value) {
          if (value.isEmpty) {
            return '* Password is required';
          }
          if (value.length < 6) {
            return '* Minimum length should be 6 digit';
          }
          _inputPassword = value;
          return null;
        },
      );
    }

    Widget _buildConfirmPwdTextFormField() {
      return TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        style: monospaceWhiteItalicTextStyle(),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_lock),
            filled: true,
            labelText: 'Confirm Password',
            labelStyle: monospaceWhiteItalicTextStyle(),
            errorStyle: monospaceRedBoldItalicTextStyle()),
        validator: (String value) {
          if (value != _inputPassword) {
            return '* Passwords do not match';
          }
          return null;
        },
      );
    }

    Widget _buildCheckBox() {
      return CheckboxListTile(
        title: Text('Accept terms and conditions',
            style: monospaceWhiteItalicSmallTextStyle()),
        value: _acceptTermsCondtnChecked,
        activeColor: kBlueBlue150,
        onChanged: (bool value) {
          setState(() {
            _acceptTermsCondtnChecked = value;
          });
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
            child: Text('Cancel', style: monospaceBlackBoldItalicTextStyle()),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Text('Continue', style: monospaceBlackBoldItalicTextStyle()),
            onPressed: _validateForm,
          )
        ],
      );
    }

    Widget _buildHeader() {
      return Row(
        children: <Widget>[
          Image.asset('assets/send-message-button.png', height: 35, width: 35),
          SizedBox(width: 8.0),
          Text('BLUE',
              style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ))
        ],
      );
    }

    return Scaffold(
      body: Container(
        decoration: _buildLinearGradient(),
        child: SafeArea(
          child: Form(
            key: _signUpFormKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              children: <Widget>[
                SizedBox(height: 40.0),
                _buildHeader(),
                SizedBox(height: 50.0),
                _buildNameTextFormField(),
                SizedBox(height: 8.0),
                _buildEmailTextFormField(),
                SizedBox(height: 8.0),
                _buildPasswordTextFormField(),
                SizedBox(height: 8.0),
                _buildConfirmPwdTextFormField(),
                SizedBox(height: 8.0),
                _buildCheckBox(),
                _buildButtonBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (!_signUpFormKey.currentState.validate()) return;
    if (!_acceptTermsCondtnChecked) return;
  }
}
