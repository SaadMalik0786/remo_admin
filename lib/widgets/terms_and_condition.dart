import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("By registering you agree to our"),
        RichText(
          text: const TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyle(color: Const.kPrimary),
            children: <TextSpan>[
              TextSpan(text: 'and ', style: TextStyle(color: Colors.black)),
              TextSpan(
                text: 'Privacy Policy',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
