import 'dart:math';
import 'dart:typed_data';

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

class AddInstructionScreen extends StatefulWidget {
  const AddInstructionScreen({super.key});

  @override
  State<AddInstructionScreen> createState() => _AddInstructionScreenState();
}

class _AddInstructionScreenState extends State<AddInstructionScreen> {
  List<String> productType = ["Main Product", "Extra Item"];
  int selectedProductType = 0;
  List<Uint8List> photos = [];
  Uint8List? manual;

  void _addPhoto() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    if (pickedFile != null) {
      setState(() {
        photos.add(pickedFile);
      });
    }
  }

  void _addManualPhoto() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    manual = pickedFile;
    setState(() {});
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
                      instructionsField(),
                      addProductPhotos(),
                      const SizedBox(height: defaultPadding),
                      videoLinkField(),
                      const SizedBox(height: defaultPadding),
                      addManualPhoto(),
                      const SizedBox(height: defaultPadding),
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

  Widget addProductPhotos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Photos"),
        SizedBox(height: defaultPadding),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            for (var photo in photos)
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: Const.kGray,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: MemoryImage(photo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            GestureDetector(
              onTap: _addPhoto,
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
                    Icon(Icons.add, color: Const.kSecondary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget addManualPhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Manual"),
        const SizedBox(height: defaultPadding),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            GestureDetector(
              onTap: _addManualPhoto,
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Upload",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Const.kSecondary),
                    ),
                    SizedBox(height: 8),
                    Icon(Icons.add_circle, color: Const.kSecondary),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                color: Const.kGray,
                borderRadius: BorderRadius.circular(8.0),
                image: manual == null
                    ? null
                    : DecorationImage(
                        image: MemoryImage(manual!),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget instructionsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Instructions"),
        const CustomTextField(
          labelText: "Usage Instructions",
          lines: 4,
          isDense: false,
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

  Widget videoLinkField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Video"),
        const CustomTextField(
          labelText: "Video Link",
          isDense: false,
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

  Widget buttons() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 40,
        child: GradientButton(title: "Save", onTap: () {}),
      ),
    );
  }
}
