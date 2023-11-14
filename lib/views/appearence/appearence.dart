import 'dart:math';
import 'dart:typed_data';

import 'package:go_router/go_router.dart';
import 'package:renmo_admin/utils/utility.dart';
import 'package:renmo_admin/widgets/circular_dropdown.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/gradient_button.dart';

import '../../responsive.dart';
import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'package:flutter/material.dart';

import '../orders/order_table.dart';
import 'package:image_picker_web/image_picker_web.dart';

class Appearence extends StatefulWidget {
  const Appearence({super.key});

  @override
  State<Appearence> createState() => _AppearenceState();
}

class _AppearenceState extends State<Appearence> {
  List<String> productType = ["Main Product", "Extra Item"];
  int selectedProductType = 0;
  List<Uint8List> welcomePhotos = [];
  List<Uint8List> homePhotos = [];

  void _addWelcomePhoto() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    if (pickedFile != null) {
      setState(() {
        welcomePhotos.add(pickedFile);
      });
    }
  }

  void _addHomePhoto() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    if (pickedFile != null) {
      setState(() {
        welcomePhotos.add(pickedFile);
      });
    }
  }

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
              padding: const EdgeInsets.all(defaultPadding),
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
                      const SubHeader(title: "Welcome screen carousel photos"),
                      const SizedBox(height: defaultPadding),
                      addWelcomePhotos(),
                      const SizedBox(height: defaultPadding),
                      const SubHeader(title: "Home screen carousel photos"),
                      const SizedBox(height: defaultPadding),
                      addHomePhotos(),
                      const SizedBox(height: defaultPadding),
                      appearanceDetails(),
                      buttons()
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

  Widget addWelcomePhotos() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        for (var photo in welcomePhotos)
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: MemoryImage(photo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        GestureDetector(
          onTap: _addWelcomePhoto,
          child: Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Const.kGray,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Photos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Const.kSecondary),
                ),
                SizedBox(height: 8),
                Icon(Icons.add_circle, color: Const.kSecondary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget addHomePhotos() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        for (var photo in homePhotos)
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: MemoryImage(photo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        GestureDetector(
          onTap: _addWelcomePhoto,
          child: Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Const.kGray,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Photos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Const.kSecondary),
                ),
                SizedBox(height: 8),
                Icon(Icons.add_circle, color: Const.kSecondary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget appearanceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Product details"),
        CircularDropdownButton(
          options: [],
          onChanged: (String? value) {},
          hint: 'Select Item',
          hintColor: Const.kPrimary,
        ),
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

  Widget buttons() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton(
                  title: "Add another Item",
                  titleColor: Colors.black,
                  backColor: Const.kGray,
                  onTap: () {
                    GoRouter.of(context).go(Routes.addInstruction);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
