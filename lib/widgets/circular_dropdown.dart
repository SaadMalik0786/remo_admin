import 'package:flutter/material.dart';
import '/utils/constants.dart';

class CircularDropdownButton extends StatelessWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  final String hint;
  final Color? hintColor;
  final bool isHintCentre;

  const CircularDropdownButton(
      {super.key,
      required this.options,
      required this.onChanged,
      required this.hint,
      this.hintColor,
      this.selectedOption,
      this.isHintCentre = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20.0), // Customize the border radius
        border: Border.all(color: Const.kGray), // Customize the border color
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedOption,
            onChanged: onChanged,
            isExpanded: true,
            hint: isHintCentre
                ? Center(
                    child: Text(
                    hint,
                    style: TextStyle(color: hintColor),
                  ))
                : Text(
                    hint,
                    style: TextStyle(color: hintColor),
                  ),
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(
                    child: Text(
                  value,
                  textAlign: TextAlign.center,
                )),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
