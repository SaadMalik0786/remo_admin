import 'package:flutter/material.dart';
import '/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backColor;
  final double radius;
  final Function() onTap;
  final EdgeInsetsGeometry? padding;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.padding,
        this.radius=16,
      this.titleColor = Colors.white,
      this.backColor = Const.kGray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backColor),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: titleColor),
        ),
      ),
    );
  }
}
