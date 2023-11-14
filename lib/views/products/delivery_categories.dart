import 'package:flutter/material.dart';
import 'package:renmo_admin/widgets/circular_dropdown.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/gradient_button.dart';

import '../../utils/constants.dart';
import '../../utils/utility.dart';
import '../../widgets/header.dart';

class DeliveryCategories extends StatelessWidget {
  static List<String> categoriesList = [
    "Tools",
    "Cleaning",
    "Garden",
    "Parties and Events",
    "Car Accessories",
    "Travel and Hiking",
    "Sports",
    "Hobbies",
    "Home Appliances",
    "Electronics",
    "Vehicles",
    "Other"
  ];

  static List<String> subCategoriesList = [
    "Drills",
    "Saws and Cutters",
    "Grinders",
    "Planers",
    "Fasteners",
    "Generators",
    "Welding",
    "Breaker Hammers",
    "Measuring Tools",
    "Ladders and Scaffoldings",
    "Lights",
    "Garden Tools",
    "Compressors",
    "Other",
  ];

  const DeliveryCategories({Key? key}) : super(key: key);

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
              title: "Product",
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding).copyWith(bottom: 0),
              child: backWidget(context),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      categories(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Main Categories"),
        const Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextField(
                  isDense: false, labelText: "Delivery category name"),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: CustomTextField(isDense: false, labelText: "Price"),
            ),
          ],
        ),
        Center(
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  title: "Add Category",
                  titleColor: Colors.black,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        Center(
          child: Container(
            height: 40,

            constraints: BoxConstraints(
              maxWidth: 300
            ),
            child: GradientButton(
              title: "Save",
              onTap: () {},
            ),
          ),
        )

      ]
          .expand((element) => [
                element,
                const SizedBox(
                  height: defaultPadding,
                )
              ])
          .toList(),
    );
  }
}
