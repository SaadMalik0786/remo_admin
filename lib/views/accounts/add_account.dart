import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/utils/utility.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/gradient_button.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({Key? key}) : super(key: key);

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  List<String> accountType = ["Courier", "Admin"];
  int selectedAccountType = 0;

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
              title: "Accounts",
            ),
           Padding(
             padding: const EdgeInsets.all(defaultPadding),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: defaultPadding),
                 backWidget(context),
                 const SizedBox(height: defaultPadding),
                 accountForm()
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

  Widget accountForm() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeader(title: "Add an account"),
          const CustomTextField(
            labelText: "First Name",
            isDense: false,
          ),
          const CustomTextField(
            labelText: "Last Name",
            isDense: false,
          ),
          const CustomTextField(
            labelText: "Phone Number",
            isDense: false,
          ),
          const CustomTextField(
            labelText: "Email Address",
            isDense: false,
          ),
          const SubHeader(title: "Account Role"),

          Row(
            children: List.generate(accountType.length, (index) {
              return SizedBox(
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CheckboxListTile(
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    contentPadding: EdgeInsets.zero,
                    title: Text(accountType[index]),
                    value: selectedAccountType == index,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedAccountType = index;
                      });
                    },
                    checkboxShape: const CircleBorder(),
                  ),
                ),
              );
            }),
          ),
          GradientButton(title: "Save",padding: const EdgeInsets.all(8), onTap: () {})
        ]
            .expand(
                (element) => [element, const SizedBox(height: defaultPadding)])
            .toList(),
      ),
    );
  }
}
