import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/constants.dart';

PreferredSizeWidget logoAppBar({bool isShowLeading = false}) {
  return AppBar(
    title: Image.asset(Const.appLogo, height: 50),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: !isShowLeading
        ? null
        : IconButton(
            icon: const Icon(Icons.arrow_back, color: Const.kPrimary),
            onPressed: () {
              Get.back();
            },
          ),
  );
}
