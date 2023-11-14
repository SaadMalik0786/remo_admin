import 'package:flutter/material.dart';
const defaultPadding = 20.0;

class Const {
  static const appTitle = "Renmo";

  //Colors
  static const Color kPrimary = Color(0xffF33993);
  static const Color kSecondary = Color(0xff0D0044);
  static const Color kBlue = Color(0xff57125E);
  static const Color kGray = Color(0xffD9D9D9);

  // Image
  static const String appLogo = "assets/images/app_logo.png";
  static const String mainCarousalBackground =
      "assets/images/main_corousal_background.png";
  static const String flag1 = "assets/images/flag1.png";
  static const String flag2 = "assets/images/flag2.png";
  static const String flag3 = "assets/images/flag3.png";
  static const String fbIcon = "assets/images/facebook_icon.png";
  static const String googleIcon = "assets/images/google_icon.png";
  static const String mailIcon = "assets/images/mail_icon.png";
  static const String itemBackground = "assets/images/item_background.png";
  static const String product = "assets/images/product.png";
  static const String youtubeInstruction =
      "assets/images/video_instruction.png";
  static const String itemOverview = "assets/images/item_overview.png";
  static const String profile = "assets/images/profile.png";
  static const String imageFrontSide = "assets/images/frontSideImage.png";
  static const String imageBackSide = "assets/images/backSideImage.png";
  static const String selfie = "assets/images/selfie.png";

  //Size and TextStyles
  static const double horizontalPadding = 20;
  static const double verticalPadding = 20;

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

  static List<String> itemsList = [
    "Textile washer",
    "Circular saw",
    "Drill",
    "Roof box",
    "Trampoline",
    "Lawn mower",
  ];
}

class Routes{
  static String dashboard='/dashboard';
  static String products='/products';
  static String orders='/orders';
  static String statistics='/statistics';
  static String contactsupport='/contactsupport';
  static String customers='/customers';
  static String accounts='/accounts';
  static String appearance='/appearance';
  //order
  static String orderDetails='/orders/order_details';

  //customer
  static String customerDetails='/customers/details';

  //productsRouts
  static String addProduct='/products/add';
  static String addInstruction='/products/add_instruction';
  static String editCategories='/products/edit_categories';
  static String deliveryCategories='/products/delivery_categories';
  static String editCategorySingle='/products/edit_category';

  //customer Support
  static String chat='/contactsupport/chat';
  static String faq='/contactsupport/faq';

  //statistics
  static String chart='/statistics/chart';
  static String popularProducts='/statistics/popular_product';

  //account
  static String addAccount='/accounts/add';
  static String accountDetail='/accounts/detail';

}
