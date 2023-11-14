import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(title: "Dashboard",),
            const SizedBox(height: defaultPadding),
            ordersCount(context),
            const SizedBox(height: defaultPadding),

            OrderTable()

          ],
        ),
      ),
    );
  }

  Widget ordersCount(context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.2,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      crossAxisCount: _getCrossAxisCount(context),
      children: [
        orderCountContainer(context, Const.kPrimary, "Pending Orders", 26),
        orderCountContainer(context, Const.kBlue, "Items Currently Rented", 55),
        orderCountContainer(context, Const.kSecondary, "Orders Today", 1293),
        orderCountContainer(context, Const.kPrimary, "Unresolved Tickets", 12),
        orderCountContainer(context, Const.kBlue, "Registered Users", 3641),
        orderCountContainer(context, Const.kSecondary, "Orders Today", 43),
      ],
    );
  }

  Widget orderCountContainer(context,Color backColor,String title,int count) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backColor,
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(context) {
    if (Responsive.isDesktop(context)) {
      // Desktop layout
      return 3;
    } else if (Responsive.isTablet(context)) {
      // Tablet layout
      return 3;
    } else {
      // Mobile layout
      return 1;
    }
  }
}
