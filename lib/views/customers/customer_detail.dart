import 'package:dotted_border/dotted_border.dart';
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

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({Key? key}) : super(key: key);

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
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
              title: "Customers",
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultPadding),
                  backWidget(context),
                  const SizedBox(height: defaultPadding),
                  accountForm(),
                  const SizedBox(height: defaultPadding),
                  SizedBox(
                    height: 50,
                    width: 700,
                    child: Row(
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
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      DottedBorder(
                        child: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SubHeader(title: "Order no 201884"),
                              Text( "05/06/2023 17:22",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Const.kPrimary),),                              SubHeader(title: "Makita circular saw 5007MGA"),
                              SubHeader(title: "Protective gloves"),
                              SubHeader(title: "Insurance"),
                              SubHeader(title: "Total:  46,50 €"),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(width: 16),
                      DottedBorder(
                        child: const Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubHeader(title: "Order no 201884"),
                              Text( "05/06/2023 17:22",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Const.kPrimary),),
                              SubHeader(title: "Makita circular saw 5007MGA"),
                              SubHeader(title: "Protective gloves"),
                              SubHeader(title: "Insurance"),
                              SubHeader(title: "Total:  46,50 €"),
                            ],
                          ),
                        ),

                      ),
                    ],
                  )
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
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Const.kGray),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SubHeader(title: "Company details"),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeader(title: "Name: Company OÜ"),
              SubHeader(title: "Address: Tartu mnt 92, 10922, Tallinn"),
              SubHeader(title: "Company VAT code: 10242104"),
            ],
          )
        ]
            .expand(
                (element) => [element, const SizedBox(height: defaultPadding)])
            .toList(),
      ),
    );
  }
}
