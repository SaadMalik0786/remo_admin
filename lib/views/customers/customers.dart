import 'package:dotted_line/dotted_line.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: "Customers",
            ),
            const SizedBox(height: defaultPadding),
            customerGrid(context),
            const SizedBox(height: defaultPadding),
            const SearchField(
                hintMain: "Search for users", hintDropdown: "Filter"),
            const SizedBox(height: defaultPadding),
            const SizedBox(height: defaultPadding),
            customerOrders(context)
          ],
        ),
      ),
    );
  }

  Widget customerGrid(context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3.0,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      crossAxisCount: _getCrossAxisCount(context),
      children: [
        customerGridContainer(context, Const.kPrimary, "Registered Users", 12),
        customerGridContainer(context, Const.kBlue, "Verified Users", 3641),
        customerGridContainer(context, Const.kSecondary, "Customers", 43),
      ],
    );
  }

  Widget customerGridContainer(
      context, Color backColor, String title, int count) {
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

  Widget customerOrders(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Customers",
              style: TextStyle(color: Const.kBlue),
            ),
            SizedBox(
              width: 150,
              child: Center(
                  child: Text(
                "Orders",
                style: TextStyle(color: Const.kBlue),
              )),
            )
          ],
        ),
        const Divider(
          color: Const.kPrimary,
        ),
        ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                GoRouter.of(context).go(Routes.customerDetails);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(Const.profile),
                      ),
                      title: Text(
                        "Felix Baumgartner",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("+372 5555 5555"),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                          "Felix: Hi, I wanted to ask if it will be possible to rent a ph...")),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        "8",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const DottedLine(),
        )
      ],
    );
  }
}
