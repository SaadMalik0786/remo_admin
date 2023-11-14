import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';

enum ChatType { general, order }

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
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
              title: "Customer Support",
            ),
            const SizedBox(height: defaultPadding),
            supportButtons(),
            const SizedBox(height: defaultPadding),
            chats()
          ],
        ),
      ),
    );
  }

  Widget supportButtons() {
    return Row(
      children: [
        CustomButton(
            title: "Edit Faq",
            backColor: Const.kPrimary,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {
              GoRouter.of(context).go(Routes.faq);

            },),
      ],
    );
  }

  Widget chats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chats",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),

        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 150,
              child: Center(child: Text("Type",style: TextStyle(color: Const.kBlue),)),
            )
          ],
        ),
        const Divider(
          color: Const.kPrimary,
        ),
        ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                GoRouter.of(context).go(Routes.chat);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(Const.profile),
                      ),
                      title: Text(
                        "Felix Baumgartner",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("+372 5555 5555"),
                    ),
                  ),
                  const Expanded(
                      flex: 2,
                      child: Text(
                          "Felix: Hi, I wanted to ask if it will be possible to rent a ph...")),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        index == 0 ? "Order" : "General",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: index == 0 ? Const.kPrimary : Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context,index)=>const DottedLine(),
        )
      ],
    );
  }
}
