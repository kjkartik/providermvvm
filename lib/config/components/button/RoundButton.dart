import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_mvvm/config/color/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    log("loading  ${loading}");

    return InkWell(
        onTap:!loading ? onPress:(){},
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(18)),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title,
                      style: const TextStyle(fontSize: 17 ,color: AppColor.black,fontWeight: FontWeight.w700),
                    )),
        ));
  }
}
