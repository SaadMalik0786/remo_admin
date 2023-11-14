import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/views/orders/order_table.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _ProductsState();
}

class _ProductsState extends State<Orders> {
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
              title: "Orders",
            ),
            const SizedBox(height: defaultPadding),
            productButtons(),
            const SizedBox(height: defaultPadding),
            const SearchField(hintMain: "Search for orders", hintDropdown: "Filter"),
            const SizedBox(height: defaultPadding),
            OrderTable()
          ],
        ),
      ),
    );
  }

  Widget productButtons() {
    return Row(
      children: [
        CustomButton(
            title: "Download Invoices",
            backColor: Const.kPrimary,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {}),
        const SizedBox(width: 8),
        CustomButton(
            title: "Download Contracts",
            backColor: Const.kBlue,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {}),

      ],
    );
  }


}
