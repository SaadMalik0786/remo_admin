import 'package:dotted_line/dotted_line.dart';
import 'package:renmo_admin/utils/utility.dart';
import 'package:renmo_admin/widgets/custom_button.dart';

import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List<String> faqs = [
    "Where can I order the rented items?",
    "Can I rent items as a company?",
    "Where can I find usage instructions?",
    "Who is responsible if the item breaks down?",
    "Can I pick up the rented item myself?",
  ];

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
              title: "Customer Support",
            ),
            const SizedBox(height: defaultPadding),
            backWidget(context),
            const SizedBox(height: defaultPadding),
            const DottedLine(),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: const Icon(Icons.help, color: Const.kPrimary),
                title: const Text(
                  "Frequently asked questions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: List.generate(
                  faqs.length,
                  (index) => ExpansionTile(
                    title: Text(faqs[index]),
                    childrenPadding: const EdgeInsets.symmetric(
                        horizontal: Const.horizontalPadding),
                    children: const [
                      Text(
                          "All items must be rented in the name of a private individual who shall be responsible for the correct use of the item.However, it is possible to create an invoice in the name of your company. Please select “I need an invoice” during the checkout process and fill in your company’s details OR go to your profile and add your company’s details there.")
                    ],
                  ),
                ),
              ),
            ),
            const DottedLine(),
            const SizedBox(height: defaultPadding),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    title: "Add another item",
                    radius: 12,
                    titleColor: Colors.black,
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
