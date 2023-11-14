import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:renmo_admin/widgets/custom_button.dart';
import 'package:renmo_admin/widgets/custom_text_field.dart';
import 'package:renmo_admin/widgets/search_field.dart';

import '../../utils/constants.dart';
import '../../widgets/header.dart';


class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
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
              title: "Accounts",
            ),
            const SizedBox(height: defaultPadding),
            supportButtons(),
            const SizedBox(height: defaultPadding),
            accountsList()
          ],
        ),
      ),
    );
  }

  Widget supportButtons() {
    return Row(
      children: [
        CustomButton(
            title: "Add an account",
            backColor: Const.kPrimary,
            radius: 12,
            padding: const EdgeInsets.all(8),
            onTap: () {
              GoRouter.of(context).go(Routes.addAccount);
            }),
      ],
    );
  }

  Widget accountsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Admin and courier accounts",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),

        ),

        const SizedBox(height: defaultPadding),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text("Accounts",style: TextStyle(color: Const.kBlue),)),

            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Center(child: Text("Role",style: TextStyle(color: Const.kBlue),)),
                ),
                SizedBox(
                  width: 150,
                  child: Center(child: Text("Order Completed",style: TextStyle(color: Const.kBlue),)),
                )
              ],
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
            return InkWell(
              onTap: (){
                GoRouter.of(context).go(Routes.accountDetail);
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
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        index == 0 ? "Admin" : "Courier",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Colors.black),
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 150,
                    child: Center(
                      child: Text(
                        index == 0 ? "0" : "66",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
