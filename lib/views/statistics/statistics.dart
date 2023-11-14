import 'package:go_router/go_router.dart';

import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';

class Statistics extends StatelessWidget {

  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(title: "Statistics",),
            const SizedBox(height: defaultPadding),
            statisticsGrid(context),

          ],
        ),
      ),
    );
  }

  Widget statisticsGrid(context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3.0,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      crossAxisCount: _getCrossAxisCount(context),
      children: [
        GestureDetector(
            onTap: (){
              GoRouter.of(context).go(Routes.chart);
            },
            child: statisticsGridContainer(context, Const.kPrimary, "Pending Orders", 26)),
        statisticsGridContainer(context, Const.kBlue, "Items Currently Rented", 55),
        statisticsGridContainer(context, Const.kSecondary, "Orders Today", 1293),
        statisticsGridContainer(context, Const.kPrimary, "Popular search terms", 12),
        GestureDetector(
            onTap: (){
              GoRouter.of(context).go(Routes.popularProducts);

            },
            child: statisticsGridContainer(context, Const.kBlue, "Popular items", 3641)),
        statisticsGridContainer(context, Const.kSecondary, "Orders Today", 43),
        statisticsGridContainer(context, Const.kPrimary, "Registered Users", 12),
        statisticsGridContainer(context, Const.kBlue, "Verified Users", 3641),
        statisticsGridContainer(context, Const.kSecondary, "Customers", 43),
      ],
    );
  }

  Widget statisticsGridContainer(context,Color backColor,String title,int count) {
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
