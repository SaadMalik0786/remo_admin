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

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
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
          ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              leading: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Const.profile), // Path to your image
                    fit: BoxFit.fill, // Adjust the fit as needed
                  ), // Path to your image
                ),
              ),
              title: const Text(
                "Chris Stone",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            width: 500,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8,

              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SubHeader(title: "Email Address"),
                  Text("chris.stone@gmail.com"),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SubHeader(title: "Phone Number"),
                  Text("chris.stone@gmail.com"),
                ]),
              ],
            ),
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
          SizedBox(
            height: 50,
            child: Wrap(
              runSpacing: 8,
              children: [
                Expanded(
                  child: GradientButton(
                      title: "Save",
                      padding: const EdgeInsets.all(8),
                      onTap: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                      title: "Delete account",
                      padding: const EdgeInsets.all(8),
                      titleColor: Colors.black,
                      onTap: () {}),
                )
              ],
            ),
          )
        ]
            .expand(
                (element) => [element, const SizedBox(height: defaultPadding)])
            .toList(),
      ),
    );
  }
}
