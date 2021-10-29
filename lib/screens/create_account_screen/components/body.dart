import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppify/components/custom_suffix_icon.dart';
import 'package:shoppify/components/default_button.dart';
import 'package:shoppify/components/form_error.dart';
import 'package:shoppify/components/no_account_text.dart';
import 'package:shoppify/model/user_model.dart';
import 'package:shoppify/network/authentication_service.dart';
import 'package:shoppify/network/firebase_manager.dart';
import 'package:shoppify/screens/home_connected/home_connected.dart';
import 'package:shoppify/screens/sign_in/sign_in_screen.dart';

import '../../../constant.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Register yourself",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your email and password",
                textAlign: TextAlign.center,
              ),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? mail, password, passwordConfirm;

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
    AuthenticationService();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildTextFormFieldEmail(Icons.mail_outline_outlined),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildTextFormFieldPassword(Icons.lock_outlined),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildTextFormFieldConfirmedPassword(Icons.lock_outlined),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
              text: "Continue",
              press: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (password != passwordConfirm &&
                      !errors.contains(kConfirmPassError)) {
                    setState(() {
                      errors.add(kConfirmPassError);
                    });
                  } else if (errors.contains(kConfirmPassError)) {
                    setState(() {
                      errors.remove(kConfirmPassError);
                    });
                  }
                  if(password == passwordConfirm) {
                    dynamic result = await _authenticationService.signUp(
                        email: mail!, password: password!);
                    if (result == null) {
                      setState(() {
                        //loading = false;
                      });
                    } else {
                      AppUser mUser = AuthenticationService().getUserFirebase();
                      FirebaseManager().addUser(mUser, mUser.uid!);
                      Navigator.pushNamed(context, HomeConnected.routeName);
                    }
                  }
                }
              }),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          NoAccountText(
            text1: "Already have an account? ",
            text2: " Sign in",
            press: () {
              Navigator.pushReplacementNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
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
            password = value;
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

  TextFormField buildTextFormFieldConfirmedPassword(IconData iconData) {
    return TextFormField(
      onSaved: (newValue) => passwordConfirm = newValue,
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
      decoration: buildInputDecoration(
          iconData, "Confirm password", "Enter your password"),
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
