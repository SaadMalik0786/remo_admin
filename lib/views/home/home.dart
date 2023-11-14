
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import 'package:renmo_admin/widgets/custom_button.dart';

import '../../controllers/MenuAppController.dart';
import '../../responsive.dart';
import 'components/side_menu.dart';
class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({Key? key,required this.child}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String initialRoute='/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),

             Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: widget.child
            ),
          ],
        ),
      ),
    );
  }
}
