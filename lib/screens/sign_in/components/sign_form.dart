import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppify/components/custom_suffix_icon.dart';
import 'package:shoppify/components/default_button.dart';
import 'package:shoppify/components/form_error.dart';
import 'package:shoppify/components/loading.dart';
import 'package:shoppify/network/authentication_service.dart';
import 'package:shoppify/network/firebase_manager.dart';
import 'package:shoppify/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppify/screens/home_connected/home_connected.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final AuthenticationService _authenticationService =
      AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? mail, password;
  bool remember = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildTextFormFieldEmail(Icons.mail_outline_outlined),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                buildTextFormFieldPassword(Icons.lock_outlined),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: kPrimaryColor,
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      },
                    ),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName),
                      child: Text(
                        "Forgot passord",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultButton(
                    text: "Continue",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        dynamic result = await _authenticationService.signIn(email: mail!, password: password!);
                        if (result == null) {
                          setState(() {
                            //loading = false;
                          });
                        } else{
                          Navigator.pushReplacementNamed(
                              context, HomeConnected.routeName);
                        }
                      }
                    }),
              ],
            ),
          );
  }

  TextFormField buildTextFormFieldPassword(IconData iconData) {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.isNotEmpty &&
            value.length >= 6 &&
            errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.isNotEmpty &&
            value.length < 6 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration:
          buildInputDecoration(iconData, "Password", "Enter your password"),
    );
  }

  TextFormField buildTextFormFieldEmail(IconData iconData) {
    return TextFormField(
      onSaved: (newValue) => mail = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (value.isNotEmpty &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: buildInputDecoration(iconData, "Email", "Enter your email"),
    );
  }

  InputDecoration buildInputDecoration(
      IconData mIcon, String label, String hinText) {
    return InputDecoration(
        labelText: label,
        hintText: hinText,
        suffixIcon: CustomSuffixIcon(
          mIcon: mIcon,
        ));
  }
}
