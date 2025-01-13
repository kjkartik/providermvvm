import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/view/login/widget/input_email_widget.dart';
import 'package:provider_mvvm/view/login/widget/login_button_widget.dart';
import 'package:provider_mvvm/view/login/widget/password_email_widget.dart';

import '../../config/color/color.dart';
import '../../config/components/button/RoundButton.dart';
import '../../view_model/home/home_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");
  var emailFocus = FocusNode();
  var passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.black.withOpacity(0.1),
                        radius: 25,
                        child: const Icon(
                          Icons.workspace_premium,
                          size: 31,
                          color: AppColor.black,
                        ),
                      ),
                      const Text(
                        "  UI Movies",
                        style:
                            TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 7,
                  ),
                  const Text(
                    "Nice to see you again✌✌",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 41,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height / 31,
                  ),
                  InputEmailWidget(
                    label: "email",
                    controller: emailController,
                    focusNode: emailFocus,
                  ),
                  SizedBox(
                    height: height / 31,
                  ),
                  InputPasswordWidget(
                      label: "Password",
                      controller: passwordController,
                      focusNode: passwordFocus),
                  SizedBox(
                    height: height / 31,
                  ),
                  Center(
                    child: LoginButtonWidget(
                      emailController: emailController,
                      passwordController: passwordController,

                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
