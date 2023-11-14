import 'package:dotted_line/dotted_line.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/utils/utility.dart';
import 'package:renmo_admin/views/statistics/components/filters.dart';
import 'package:renmo_admin/widgets/custom_button.dart';

import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';

class PopularProductStatistics extends StatelessWidget {
  const PopularProductStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: "Statistics",
            ),
            const SizedBox(height: defaultPadding),
            backWidget(context),
            const SizedBox(height: defaultPadding),
            const Filters(),
            const SizedBox(height: defaultPadding),
            const SubHeader(title: "Most popular products"),
            const SizedBox(height: defaultPadding),
            popularProductList(context),
            const SizedBox(height: defaultPadding),

            const SubHeader(title: "Most popular categories"),
            const SizedBox(height: defaultPadding),
            popularProductList(context),
          ],
        ),
      ),
    );
  }

  Widget popularProductList(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Text(
              "Products",
              style: TextStyle(color: Const.kBlue),
            )),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Center(
                      child: Text(
                    "Number of orders",
                    style: TextStyle(color: Const.kBlue),
                  )),
                ),
                SizedBox(
                  width: 150,
                  child: Center(
                      child: Text(
                    "Revenue",
                    style: TextStyle(color: Const.kBlue),
                  )),
                )
              ],
            )
          ],
        ),
        const Divider(
          color: Const.kPrimary,
          height: defaultPadding,
        ),
        ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: productDetail(context),
                ),
                const SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      "Courier",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  child: Center(
                    child: Text(
                      "66",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: DottedLine(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: "Show more",
              backColor: Const.kGray,
              titleColor: Colors.black,
              onTap: () {},
            )
          ],
        )
      ],
    );
  }

  Widget productDetail(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 80,
            width: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Const.product,
                  height: 80,
                  width: 100,
                  fit: BoxFit.cover,
                ))),
        const SizedBox(width: 8),
        Text(
          "Makita circular saw 5007MGA",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
