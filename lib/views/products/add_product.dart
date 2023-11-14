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

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<String> productType = ["Main Product", "Extra Item"];
  int selectedProductType = 0;
  List<Uint8List> photos = [];

  void _addPhoto() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();
    print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        photos.add(pickedFile);
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
                      productTypes(),
                      const SizedBox(height: defaultPadding),
                      addProductPhotos(),
                      const SizedBox(height: defaultPadding),
                      productDetails(),
                      mainCategory(),
                      const SizedBox(height: defaultPadding),
                      prices(),
                      const SizedBox(height: defaultPadding),
                      stock(),
                      const SizedBox(height: defaultPadding),
                      extras(),
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

  Widget productTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Product Type"),
        const SizedBox(height: defaultPadding),
        Row(
          children: List.generate(productType.length, (index) {
            return SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CheckboxListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: Text(productType[index]),
                  value: selectedProductType == index,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedProductType = index;
                    });
                  },
                  checkboxShape: const CircleBorder(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget addProductPhotos() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        for (var photo in photos)
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
    );
  }

  Widget productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Product details"),
        const CustomTextField(
          labelText: "Product title",
          isDense: false,
        ),
        const CustomTextField(
          labelText: "Description",
          lines: 4,
          isDense: false,
        )
      ]
          .expand((element) =>
      [
        element,
        const SizedBox(
          height: defaultPadding,
        )
      ])
          .toList(),
    );
  }

  Widget mainCategory() {
    return SizedBox(
      width: 800,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 350,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeader(title: "Main Category"),
                const SizedBox(height: defaultPadding),
                CircularDropdownButton(
                  options: [],
                  onChanged: (val) {},
                  hint: "Search item",
                  hintColor: Const.kPrimary,
                  isHintCentre: false,
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add another category"),
                      Icon(Icons.add, size: 20)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 350,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeader(title: "Subcategory"),
                const SizedBox(height: defaultPadding),
                CircularDropdownButton(
                  options: [],
                  onChanged: (val) {},
                  hint: "Search item",
                  hintColor: Const.kPrimary,
                  isHintCentre: false,
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add another subcategory"),
                      Icon(Icons.add, size: 20)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget prices() {
    return SizedBox(
      width: 800,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 280),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeader(title: "Daily prices (in EUR)"),
                SizedBox(height: defaultPadding),
                SizedBox(
                  width: 280,
                  child: Wrap(
                    spacing: defaultPadding,
                    runSpacing: defaultPadding,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        child: CustomTextField(
                          labelText: "24 hours",
                          isDense: false,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: CustomTextField(
                          labelText: "Up to 3 days",
                          isDense: false,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: CustomTextField(
                          labelText: "Up to 7 days",
                          isDense: false,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: CustomTextField(
                          labelText: "After 7 days",
                          isDense: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeader(title: "Risk Protection price"),
                SizedBox(height: defaultPadding),
                CustomTextField(
                  labelText: "Price per day",
                  isDense: false,
                ),
              ],
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SubHeader(title: "Risk Protection price"),
                const SizedBox(height: defaultPadding),
                CircularDropdownButton(
                  options: [],
                  onChanged: (val) {},
                  hint: "Category",
                  hintColor: Const.kPrimary,
                  isHintCentre: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Stock"),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 130,
              child: CustomTextField(
                labelText: "Quantity",
                isDense: false,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              constraints: const BoxConstraints(maxWidth: 250),
              child: CircularDropdownButton(
                options: [],
                onChanged: (val) {},
                hint: "Location",
                hintColor: Const.kPrimary,
                isHintCentre: false,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget extras() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Extras"),
        const SizedBox(height: defaultPadding),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularDropdownButton(
                    options: [],
                    onChanged: (val) {},
                    hint: "Select Item",
                    hintColor: Const.kPrimary,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        title: "Add another item",
                        titleColor: Colors.black,
                        padding: const EdgeInsets.all(8),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: defaultPadding),
            SizedBox(
                height: 50,
                child: CustomButton(
                  title: "Add",
                  onTap: () {},
                  titleColor: Colors.white,
                  backColor: Const.kPrimary,
                ))
          ],
        ),
      ],
    );
  }

  Widget buttons() {
    return Center(
      child: SizedBox(
        width: 600,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton(title: "Add or Edit Instructions",
                  titleColor: Colors.black,
                  backColor: Const.kGray,
                  onTap: () {
                  GoRouter.of(context).go(Routes.addInstruction);
                  }),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(child: GradientButton(title: "Save", onTap: () {})),
          ],
        ),
      ),
    );
  }
}

