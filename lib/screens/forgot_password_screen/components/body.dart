import 'package:flutter/material.dart';
import 'package:shoppify/components/custom_suffix_icon.dart';
import 'package:shoppify/components/default_button.dart';
import 'package:shoppify/components/form_error.dart';
import 'package:shoppify/components/no_account_text.dart';
import 'package:shoppify/screens/create_account_screen/register_account_screen.dart';
import 'package:shoppify/size_config.dart';

import '../../../constant.dart';
import '../../../theme.dart';

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
                "Forgot password",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to return account",
                textAlign: TextAlign.center,
              ),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? mail;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextFormFieldEmail(Icons.mail_outline_outlined),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {}
              }),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          NoAccountText(
              text1: "Don't have an account? ",
              text2: " Sign up",
              press: () {
                Navigator.pushNamed(context, CreateAccountScreen.routeName);
              }),
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
