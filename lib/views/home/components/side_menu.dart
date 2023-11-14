import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:renmo_admin/controllers/MenuAppController.dart';

import '../../../utils/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = context.watch<MenuAppController>().initialRoute;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide.none,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Const.appLogo, // Replace with your image path
                    width: MediaQuery.of(context).size.width *
                        0.5, // Adjust the size as needed
                  ),
                ],
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashboard.svg",
              isSelected: path.contains(Routes.dashboard),
              press: () {
                GoRouter.of(context).go(Routes.dashboard);
              },
            ),
            DrawerListTile(
              title: "Products",
              svgSrc: "assets/icons/menu_tran.svg",
              isSelected: path.contains(Routes.products),
              press: () {
                GoRouter.of(context).go(Routes.products);
              },
            ),
            DrawerListTile(
              title: "Orders",
              svgSrc: "assets/icons/menu_task.svg",
              isSelected: path.contains(Routes.orders),
              press: () {
                GoRouter.of(context).go(Routes.orders);
              },
            ),
            DrawerListTile(
              title: "Statistics",
              svgSrc: "assets/icons/menu_doc.svg",
              isSelected: path.contains(Routes.statistics),
              press: () {
                GoRouter.of(context).go(Routes.statistics);
              },
            ),
            DrawerListTile(
              title: "Customer support",
              svgSrc: "assets/icons/menu_store.svg",
              isSelected: path.contains(Routes.contactsupport),
              press: () {
                GoRouter.of(context).go(Routes.contactsupport);
              },
            ),
            DrawerListTile(
              title: "Customers",
              svgSrc: "assets/icons/menu_notification.svg",
              isSelected: path.contains(Routes.customers),
              press: () {
                GoRouter.of(context).go(Routes.customers);
              },
            ),
            DrawerListTile(
              title: "Appearance",
              svgSrc: "assets/icons/menu_profile.svg",
              isSelected: path.contains(Routes.appearance),
              press: () {
                GoRouter.of(context).go(Routes.appearance);
              },
            ),
            DrawerListTile(
              title: "Accounts",
              svgSrc: "assets/icons/menu_setting.svg",
              isSelected: path.contains(Routes.accounts),
              press: () {
                GoRouter.of(context).go(Routes.accounts);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key,
      // For selecting those three line once press "Command+D"
      required this.title,
      required this.svgSrc,
      required this.press,
      required this.isSelected})
      : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0.0,
          title: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(color: isSelected ? Const.kPrimary : null),
          ),
        ),
        const DottedLine(dashColor: Const.kGray),
      ],
    );
  }
}
