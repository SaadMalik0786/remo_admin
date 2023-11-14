import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Const.flag2),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down_sharp, color: Const.kPrimary)
          ],
        ),
      ),
    );
  }
}
