import '../utils/constants.dart';
import '/controllers/MenuAppController.dart';
import '/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuAppController.dart';
import '../responsive.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (Responsive.isDesktop(context))
          const Padding(padding: EdgeInsets.only(top: 24)),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),

        ),
      ],
    );
  }
}
class SubHeader extends StatelessWidget {
  final String title;
  const SubHeader({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold));
  }
}