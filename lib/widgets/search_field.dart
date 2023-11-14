import 'package:flutter/material.dart';
import '/utils/constants.dart';
import '/widgets/custom_text_field.dart';

class SearchField extends StatelessWidget {
  final String hintMain;
  final String hintDropdown;

  const SearchField(
      {Key? key, required this.hintMain, required this.hintDropdown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hintMain,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.zero,
                  isDense: true,
                  hint:  Text(hintDropdown),
                  items: [],
                  onChanged: (val) {},
                ),
              ),
              IntrinsicHeight(
                child: Container(
                  margin: EdgeInsets.only(right: 4),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Const.kPrimary),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
