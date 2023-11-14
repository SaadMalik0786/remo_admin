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

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
              title: "Orders",
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: defaultPadding),
                      backWidget(context),
                      const SizedBox(height: defaultPadding),
                      orderDetail(),
                      const Divider(color: Const.kPrimary, height: 32),
                      deliveryAddress(),
                      const SizedBox(height: defaultPadding),
                      reportDamage(),
                      const SizedBox(height: defaultPadding),

                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      title: "Download invoice",
                                      padding: const EdgeInsets.all(8),
                                      titleColor: Colors.black,
                                      onTap: () {}),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomButton(
                                      title: "Download contract",
                                      padding: const EdgeInsets.all(8),
                                      titleColor: Colors.black,
                                      onTap: () {}),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          GradientButton(
                              title: "Chat",
                              padding: const EdgeInsets.all(8),
                              onTap: () {}),
                        ],
                      )
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

  Widget orderDetail() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF2F3F8)),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeader(title: "Order No 20123"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "05/6/2023 17:22",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold, color: Const.kPrimary),
                      ),
                    ),
                    const Text(
                      "Makita circular saw 5007MGA",
                      style: TextStyle(fontSize: 16),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Start: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '25 May 2023 14:30',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'End: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '27 May 2023 14:30',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "22,90 €",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "2 x Protective gloves",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "22,90 €",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Insurance",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "490 €",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "490 €",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget deliveryAddress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(

                height: 80
                ,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Address",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Sõpruse puiestee 103-83"),
                    Text("Tallinn 12399"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Customer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Const.profile),
                          // Path to your image
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ), // Path to your image
                      ),
                    ),
                    title: const Text(
                      "Chris Stone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("+372 5555 5555"),
                  ),
                ],
              )
            ],
          ),
        ),
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80
                ,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Completed"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Courier",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Const.profile),
                          // Path to your image
                          fit: BoxFit.fill, // Adjust the fit as needed
                        ), // Path to your image
                      ),
                    ),
                    title: const Text(
                      "Chris Stone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("+372 5555 5555"),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget reportDamage(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Reported damage"),
        const SizedBox(height: defaultPadding),
        Text("Broken ON-OFF button. Customer claims it was already broken when received.",style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: defaultPadding),

        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.attach_file,color: Const.kPrimary),
            Text(" DSC29019202.jpg",style: TextStyle(color: Const.kPrimary),)
          ],
        )

      ],
    );
  }
}
