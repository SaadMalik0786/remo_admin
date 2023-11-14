import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';
import 'components/product_table.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String? selectedOption;
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: "Products",
            ),
            const SizedBox(height: defaultPadding),
            productButtons(),
            const SizedBox(height: defaultPadding),
            const SearchField(hintMain: "Search for products", hintDropdown: "All categories"),
            const SizedBox(height: defaultPadding),
            ProductTable()
          ],
        ),
      ),
    );
  }

  Widget productButtons() {
    return Row(
      children: [
        CustomButton(
            title: "Add a Product",
            backColor: Const.kPrimary,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {
              GoRouter.of(context).go(Routes.addProduct);
            },),
        const SizedBox(width: 8),
        CustomButton(
            title: "Edit Categories",
            backColor: Const.kBlue,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {
              GoRouter.of(context).go(Routes.editCategories);

            }),
        const SizedBox(width: 8),
        CustomButton(
            title: "Delivery Categories",
            backColor: Const.kSecondary,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {
              GoRouter.of(context).go(Routes.deliveryCategories);


            }),
      ],
    );
  }

 
}
