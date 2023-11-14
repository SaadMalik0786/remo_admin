import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/widgets/circular_dropdown.dart';

import '../../utils/constants.dart';
import '../../utils/utility.dart';
import '../../widgets/header.dart';

class EditCategories extends StatelessWidget {

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
  const EditCategories({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding:  const EdgeInsets.all(defaultPadding),
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
                      mainCategories(context),
                      subCategories(context)
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

  Widget mainCategories(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Main Categories"),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            for (var category in categoriesList)
              GestureDetector(
                onTap: (){
                  GoRouter.of(context).go(Routes.editCategorySingle);
                },
                child: Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Const.kGray,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(child: Text(category,style: const TextStyle(color: Colors.black))),
                ),
              ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                width: 130,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Const.kGray,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Const.kSecondary),
                    SizedBox(height: 8),

                    Text(
                      "Add Category",
                      style: TextStyle(color: Colors.black),
                    ),

                  ],
                ),
              ),
            ),
          ],
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
  Widget subCategories(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubHeader(title: "Sub Categories"),
        CircularDropdownButton(options: [], onChanged: (val){}, hint: "Main Category",isHintCentre: false,hintColor: Const.kPrimary),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            for (var category in subCategoriesList)
              GestureDetector(
                onTap: (){
                  GoRouter.of(context).go(Routes.editCategorySingle);

                },
                child: Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Const.kGray,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(child: Text(category,style: const TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
                ),
              ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                width: 130,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Const.kGray,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Const.kSecondary),
                    SizedBox(height: 8),

                    Text(
                      "Add Category",
                      style: TextStyle(color: Colors.black),
                    ),

                  ],
                ),
              ),
            ),
          ],
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

}
