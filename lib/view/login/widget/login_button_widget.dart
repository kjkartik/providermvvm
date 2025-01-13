import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/config/components/button/RoundButton.dart';
import 'package:provider_mvvm/config/routes/routes_name.dart';
import 'package:provider_mvvm/config/utils.dart';
import 'package:provider_mvvm/view_model/login/login_view_model.dart';

import '../../../view_model/home/home_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButtonWidget(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (BuildContext context, LoginViewModel value, Widget? child) {
      return RoundButton(
          loading: value.isLoading,
          title: "Login",
          onPress: () {
            if (emailController.text.isEmpty) {
              Utils.toastMessage("Please Enter Email");
            } else if (passwordController.text.isEmpty) {
              Utils.toastMessage("Please Enter Password");
            } else if (passwordController.text.length < 6) {
              Utils.toastMessage("Please Enter 6 Digit Password");
            } else {
              Map data = {
                "email": emailController.text.toString(),
                "password": passwordController.text.toString(),
              };
              print("value.isLoading widget  ${value.isLoading}");
              value.login(data).then((_) { 
                print("value.isLoading  ${value.isLoading}");
                Utils.toastMessage("Login Successfully");

                Navigator.pushNamed(context, RoutesName.home);
              });
            }
          });
    });
  }
}
